import 'package:flutter/material.dart';
import 'package:github_app_flutter/models/user_model.dart';
import 'package:github_app_flutter/pages/home/home_page.dart';
import 'package:github_app_flutter/pages/login/login_page.dart';
import 'package:github_app_flutter/pages/welcome/welcome_page.dart';
import 'package:github_app_flutter/provider/provider_state.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  final ProviderState _providerState = ProviderState();

  @override
  void initState() {
    // 初始化user info, 从本地获取
    // _providerState.userModel =
    // _providerState.isLogin = true;
    super.initState();
  }

  // 初始化默认route
  String _checkDefaultRoute() {
    if (_providerState.isLogin) {
      return WelcomePage.routeName;
    }
    else {
      return LoginPage.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderState>(
          create: (context) {
            return _providerState;
        }),
      ],
      child: Consumer(
        builder: (context, _provider, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: (context, widget){
              return MediaQuery(
                // 设置全局的文字大小不随着系统设置改变
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            // 配置route
            routes: {
              WelcomePage.routeName: (context) {
                return const WelcomePage();
              },
              HomePage.routeName : (context) {
                return const HomePage();
              },
              LoginPage.routeName : (context) {
                return const LoginPage();
              }
            },
            // 初始化默认rote
            // initialRoute: _checkDefaultRoute(),
          );
        },
      ),
    );
  }
}