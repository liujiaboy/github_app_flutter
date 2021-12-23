import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app_flutter/pages/home/home_page.dart';
import 'package:github_app_flutter/pages/login/login_page.dart';
import 'package:github_app_flutter/pages/login/loging_webview_page.dart';

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

  static goLoginWebview(BuildContext context, String url) {
    NavigatorRouter(context, LoginWebView(title: "Oauth", url: url));
  }
  
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  // ///Page页面的容器，做一次通用自定义
  // static Widget pageContainer(widget, BuildContext context) {
  //   return MediaQuery(
  //
  //     ///不受系统字体缩放影响
  //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
  //       child: NeverOverScrollIndicator(
  //         needOverload: false,
  //         child: widget,
  //       ));
  // }
}