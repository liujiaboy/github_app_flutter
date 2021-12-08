
import 'package:flutter/material.dart';
import 'package:github_app_flutter/models/user_model.dart';

class ProviderState with ChangeNotifier {

  // user info
  UserModel userModel = UserModel.empty();

  // is login
  var _isLogin = false;

  set isLogin(bool value) {
    if (value != _isLogin) {
      notifyListeners();
    }
    _isLogin = value;
  }

  bool get isLogin => _isLogin;

  // 主题

  // 语音
  // Locale? locale;
  // Locale? platformLocal;


  ProviderState();

}