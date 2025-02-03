import 'package:flutter/material.dart';
import 'package:vidacoletiva/data/models/user_model.dart';
import 'package:vidacoletiva/data/repositories/user_repository.dart';
import 'package:vidacoletiva/data/services/login_service.dart';

class UserController extends ChangeNotifier {
  final LoginService _loginService;
  final UserRepository _userRepository = UserRepository();

  UserController(this._loginService);

  bool isLogged = false;
  bool isLoading = true;
  bool isSuperAdmin = false;

  UserModel? user;

  init() async {
    var ac = await _loginService.signInSilently();
    if (ac != null) {
      isLogged = true;
      await Future.wait([
        _userRepository.getSelf().then((value) => user = value),
        _userRepository.getIsSuperAdmin().then((value) => isSuperAdmin = value)
      ]);
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
       await Future.wait([
        _userRepository.getSelf().then((value) => user = value),
        _userRepository.getIsSuperAdmin().then((value) => isSuperAdmin = value)
      ]);
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

  save(Map<String, dynamic> userDelta) async {
    await _userRepository.updateUser(userDelta);
    await _userRepository.getSelf().then((value) => user = value);
    notifyListeners();
  }
}
