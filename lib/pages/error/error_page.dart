import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String errorMsg;
  final FlutterErrorDetails errorDetails;

  const ErrorPage(
      {Key? key, required this.errorMsg, required this.errorDetails})
      : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            "Error Occur",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: const Text("Back"),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
