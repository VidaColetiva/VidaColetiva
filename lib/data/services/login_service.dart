import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:vidacoletiva/data/repositories/user_repository.dart';
import 'package:vidacoletiva/utils/authenticated_client.dart';

class LoginService {
  static List<String> scopes = [
    'openid',
    'email',
    'profile',
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/userinfo.profile",
  ];
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: LoginService.scopes);
  AuthenticatedClient? authClient;
  GoogleSignInAccount? _account;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserRepository userRepository;
  GoogleSignInAccount? get account {
    return _account;
  }

  LoginService(this.userRepository);

  onSignIn() async {
    var b = await _account!.authentication;
    final authCredential = GoogleAuthProvider.credential(
        accessToken: b.accessToken, idToken: b.idToken);
    try {
      await firebaseAuth.signInWithCredential(authCredential);
    } catch (err) {
      debugPrint("onSignIn: $err");
    }

    authClient = AuthenticatedClient({"Authorization": "Bearer ${b.accessToken}"});

    userRepository.createSelf();
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    _account = await googleSignIn.signIn();
    if (_account != null) {
      await onSignIn();
      return _account;
    }
    return _account;
  }

  signInWithApple() async {
    UserCredential auth;
    if (Platform.isIOS) {
      auth = await _whenPlatformApple();
    } else {
      var appleProvider = AppleAuthProvider();
      auth = await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }

    if (auth.user != null) {
      userRepository.createSelf();
    }
  }

  Future<UserCredential> _whenPlatformApple() async {
    String generateNonce([int length = 32]) {
      const charset =
          '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
      final random = Random.secure();
      return List.generate(
          length, (_) => charset[random.nextInt(charset.length)]).join();
    }

    String sha256ofString(String input) {
      final bytes = utf8.encode(input);
      final digest = sha256.convert(bytes);
      return digest.toString();
    }

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: "br.uff.vidacoletivaid",
            redirectUri: Uri.parse(
                "https://vida-coletiva-736b4.firebaseapp.com/__/auth/handler")),
        nonce: nonce);

    // Create an `OAuthCredential` from the credential returned by Apple.
    final appleOauthProvider = OAuthProvider(
      "apple.com",
    );

    appleOauthProvider.setScopes([
      'email',
      'name',
    ]);

    final oauthCredential = appleOauthProvider.credential(
      idToken: credential.identityToken,
      rawNonce: rawNonce,
    );

    UserCredential auth =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    if (auth.user != null) {
      if (auth.user != null) {
        if (auth.user?.email == null && credential.email != null) {
          await auth.user?.updateEmail(credential.email!);
        }

        if (auth.user?.displayName == null &&
            credential.givenName != null &&
            credential.familyName != null) {
          await auth.user?.updateDisplayName(
              '${credential.givenName} ${credential.familyName}');
        }
      }
    }
    return auth;
  }

  Future<GoogleSignInAccount?> signInSilently() async {
    if (_account != null) {
      await onSignIn();
      return _account;
    }
    _account = await googleSignIn.signInSilently();
    if (_account != null) {
      await onSignIn();
    }
    return _account;
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> requestGoogleDriveScope() async {
    return await googleSignIn.requestScopes( scopes + [
      'https://www.googleapis.com/auth/drive.file',
    ]);
  }
}
