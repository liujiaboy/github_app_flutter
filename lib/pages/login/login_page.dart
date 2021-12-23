import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_app_flutter/common/network/http_url_api.dart';
import 'package:github_app_flutter/utils/navigator_utils.dart';
import 'package:github_app_flutter/widget/animate_background_widget.dart';
import 'package:github_app_flutter/widget/input_widget.dart';
import 'package:github_app_flutter/widget/particle/particle_widget.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _pwController = TextEditingController();
  String _userName = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    /// 触摸收起键盘
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // 背景渐变色
              const Positioned.fill(child: AnimateBackground()),
              // 背景气泡动画
              const Positioned.fill(child: ParticleWidget(numberOfParticles: 30,)),
              // 卡片
              Center(
                child: SafeArea(
                  child: Card(
                    elevation: 5.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      // color: Colors.blue,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "static/images/logo.png",
                            width: 90,
                            height: 90,
                          ),
                          const SizedBox(height: 20,),

                          InputWidget(
                            hitText: "输入用户名",
                            iconData: Icons.account_circle_rounded,
                            onChanged: (String value) {
                              _userName = value;
                            },
                          ),

                          const SizedBox(height: 20,),

                          InputWidget(
                            hitText: "输入密码",
                            iconData: Icons.keyboard,
                            obscureText: true,
                            controller: _pwController,
                            onChanged: (String value) {
                              _password = value;
                            },
                          ),

                          const SizedBox(height: 20,),
                          Container(
                            height: 50,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: ButtonStyleButton.allOrNull<Color>(Colors.black)),
                                  onPressed: loginPressAction,
                                  child: Text("登录"),
                                ),),
                                const SizedBox(width: 20,),
                                Expanded(child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: ButtonStyleButton.allOrNull<Color>(Colors.black)),
                                  onPressed: oauthLoginAction,
                                  child: Text("认证"),
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginPressAction() {
    const String msg = "账号密码登陆的 API 将被 Github 弃用，建议使用尝试使用安全登陆。";
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
    );
  }


  oauthLoginAction() async {
    String? code = await NavigatorUtils.goLoginWebview(context, HttpUrlApi.getOAuthUrl());

    if (code != null && code.isNotEmpty) {
      // 执行登录流程

    }
  }
}
