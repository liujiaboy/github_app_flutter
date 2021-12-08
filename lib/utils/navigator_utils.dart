import 'package:flutter/cupertino.dart';
import 'package:github_app_flutter/pages/home/home_page.dart';
import 'package:github_app_flutter/pages/login/login_page.dart';

class NavigatorUtils {
  // 切换页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // 主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  // 登录
  static goLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }


}