import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/user_model.dart';
import 'package:vidacoletiva/data/services/login_service.dart';

class UserController extends ChangeNotifier {
  final LoginService _loginService;

  UserController(this._loginService);

  bool isLogged = false;
  bool isLoading = true;

  UserModel? user;

  init() async {
    var ac = await _loginService.signInSilently();
    if (ac != null) {
      isLogged = true;
    }
    isLoading = false;
    notifyListeners();
  }

  loginGoogle() async {
    isLoading = true;
    notifyListeners();
    var acc = await _loginService.signInWithGoogle();
    isLoading = false;
    if (acc != null) {
      isLogged = true;
    } else {
      isLogged = false;
    }
    notifyListeners();
  }

  logout() async {
    isLogged = false;
    await _loginService.signOut();
    notifyListeners();
  }
}
