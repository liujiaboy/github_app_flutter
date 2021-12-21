
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _ColorTween {color1, color2}

class AnimateBackground extends StatelessWidget {
  const AnimateBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_ColorTween>()
      ..add(
        _ColorTween.color1,
        const Color(0xffd38312).tweenTo(Colors.lightBlue.shade900),
        3.seconds,
      )
      ..add(_ColorTween.color2,
        const Color(0xffa83279).tweenTo(Colors.blue.shade600),
        3.seconds
      );

    return MirrorAnimation<MultiTweenValues<_ColorTween>>(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                value.get<Color>(_ColorTween.color1),
                value.get<Color>(_ColorTween.color1),
              ],
            ),
          ),
        );
      },
    );
  }
}
