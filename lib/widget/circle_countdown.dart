
import 'dart:async';

import 'package:flutter/material.dart';

class CircleCountDownWidget extends StatefulWidget {
  // 毫秒
  final double totalTime;
  final bool autoStart;
  final double size;
  final void Function() callBack;
  const CircleCountDownWidget({Key? key, required this.totalTime, required this.autoStart, this.size=40, required this.callBack}) : super(key: key);



  startTimer() {

  }

  @override
  _CircleCountDownWidgetState createState() => _CircleCountDownWidgetState();
}

class _CircleCountDownWidgetState extends State<CircleCountDownWidget> {


  // 计时器
  Timer? _timer;
  // 单订阅流
  final StreamController<double> _streamController = StreamController();
  // 当前时间
  double _currentTime = 0;

  startTimer() {
    if(_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _currentTime -= 100;
      if (_currentTime <= 0) {
        _timer!.cancel();
        _currentTime = 0;
        widget.callBack();
      }

      // 更新数据流
      _streamController.add(_currentTime);
    });
  }

  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    if (widget.autoStart) {
      startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(_timer != null) {
      _timer!.cancel();
    }
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: widget.size,
      height: widget.size,
      child: buildStreamWidget(),
    );
  }

  StreamBuilder<double> buildStreamWidget() {
    return StreamBuilder<double>(
      stream: _streamController.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // 数字倒计时
            Text(
              (snapshot.data! / 1000).toStringAsFixed(0),
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),
            // 圆弧
            CircularProgressIndicator(
              value: 1.0 - snapshot.data! / widget.totalTime,
            ),
          ],
        );
      },
    );
  }


}
