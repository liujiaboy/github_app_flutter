import 'package:flutter/material.dart';
import 'package:github_app_flutter/provider/provider_state.dart';
import 'package:github_app_flutter/utils/navigator_utils.dart';
import 'package:provider/src/provider.dart';

class WelcomePage extends StatefulWidget {

  // static String routeName = "/";
  static String routeName = "welcome";

  const WelcomePage({Key? key}) : super(key: key);

  
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      return;
    }
    _isInit = true;
    ProviderState _state = context.read<ProviderState>();
    goToRealPage();
  }

  // 跳转到对应的page
  goToRealPage() {
    ProviderState _state = context.read<ProviderState>();
    Future.delayed(const Duration(seconds: 2), (){
      if(_state.isLogin) {
        NavigatorUtils.goHome(context);
      }
      else {
        NavigatorUtils.goLogin(context);
        // Navigator.pushNamed(context, "123");
      }

    });
  }
  
  @override
  Widget build(BuildContext context) {
    // 不放在这里，是因为会导致重复push
    // goToRealPage();
    
    return Container(
      alignment: Alignment.center,
      color: Colors.orange,
      child: const Text("welcome page"),
    );
  }


}
