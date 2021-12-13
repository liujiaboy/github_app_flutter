import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:github_app_flutter/provider/provider_state.dart';
import 'package:github_app_flutter/utils/navigator_utils.dart';
import 'package:github_app_flutter/widget/circle_countdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/src/provider.dart';

class WelcomePage extends StatefulWidget {

  static String routeName = "/";
  // static String routeName = "welcome";

  const WelcomePage({Key? key}) : super(key: key);

  
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool _isInit = false;
  String _text = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 防止多次进入，导致多次执行 goToRealPage
    if (_isInit) {
      return;
    }
    _isInit = true;
    ProviderState _state = context.read<ProviderState>();

    Future.delayed(const Duration(microseconds: 500), (){
      setState(() {
        _text = "Welecome";
      });
    });

    Future.delayed(const Duration(seconds: 1, microseconds: 500), (){
      setState(() {
        _text = "GitHub App";
      });
    });

    // goToRealPage();
  }

  // 跳转到对应的page
  goToRealPage() {
    ProviderState _state = context.read<ProviderState>();
    if(_state.isLogin) {
      NavigatorUtils.goHome(context);
    }
    else {
      NavigatorUtils.goLogin(context);
    }

    // Future.delayed(const Duration(seconds: 2), (){
    //   if(_state.isLogin) {
    //     NavigatorUtils.goHome(context);
    //   }
    //   else {
    //     NavigatorUtils.goLogin(context);
    //   }
    //
    // });
  }
  
  @override
  Widget build(BuildContext context) {
    // 不放在这里，是因为会导致重复push
    // goToRealPage();
    
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            const Center(
              child: Image(
                image: AssetImage("static/images/welcome.png"),
              ),
            ),

            // 右上角倒计时
            Positioned(
              top: 100,
              right: 30,
              child: GestureDetector(
                child: CircleCountDownWidget(
                  totalTime: 5000,
                  autoStart: true,
                  callBack: () {
                    goToRealPage();
                  },
                ),
                onTap: () {

                },
              ),
            ),

            // welecome 文案
            Align(
              alignment: const Alignment(0.0, 0.3),
              child: Text(
                _text,
                style: GoogleFonts.indieFlower(
                  textStyle: TextStyle(color: Colors.black, fontSize: 60),
                ),
              ),
            ),

            // 底部动画
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                width: 200,
                child: const FlareActor(
                  "static/file/flare_flutter_logo_.flr",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  animation: "Placeholder",
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


}
