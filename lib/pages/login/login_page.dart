import 'package:flutter/material.dart';
import 'package:github_app_flutter/widget/animate_background_widget.dart';
import 'package:github_app_flutter/widget/particle/particle_widget.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(child: AnimateBackground()),
              Positioned.fill(child: ParticleWidget(numberOfParticles: 30,)),
              
            ],
          ),
        ),
      ),
    );
  }
}
