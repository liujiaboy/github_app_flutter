import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static String routeName = "home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("home page"),),
      body: Container(
        child: Text("this is home page", style: TextStyle(fontSize: 20),),
      ),

    );
  }
}
