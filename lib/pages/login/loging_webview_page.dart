
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWebView extends StatefulWidget {
  final String title;
  final String url;
  const LoginWebView({Key? key, required this.title, required this.url}) : super(key: key);

  @override
  _LoginWebViewState createState() => _LoginWebViewState();
}

class _LoginWebViewState extends State<LoginWebView> {

  bool _isLoadding = true;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          TextField(
            focusNode: _focusNode,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(  // 去掉底部细线
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(  // 去掉 输入状态时 底部细线
                borderSide: BorderSide.none,
              )
            ),
          ),
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            navigationDelegate: (NavigationRequest navigation) {
              if (navigation.url.startsWith("ljgithubapp://authed")) {
                var code = Uri.parse(navigation.url).queryParameters["code"];
                print("code = ${code}");
                Navigator.of(context).pop(code);
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoadding = false;
              });
            },
          ),

          if (_isLoadding)
            Center(
              child: Container(
                // color: Colors.white,
                width: 200,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SpinKitSpinningLines(color: Colors.black, itemCount: 3, size: 30, lineWidth: 1.5,),
                    SizedBox(width: 10,),
                    Text("Loadding..."),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
