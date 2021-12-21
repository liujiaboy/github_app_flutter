

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:supercharged/supercharged.dart';

enum ParticleOffset {x, y}

class ParticleModel {
  late MultiTween<ParticleOffset> tween;
  late double size;
  late Duration _duration;
  late Duration _startTime;
  final Random random;

  ParticleModel(this.random) {
    restart();
    shuffle();
  }


  restart() {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);

    tween = MultiTween<ParticleOffset>()
      ..add(ParticleOffset.x, startPosition.dx.tweenTo(endPosition.dx))
      ..add(ParticleOffset.y, startPosition.dy.tweenTo(endPosition.dy));

    _duration = 3000.milliseconds + random.nextInt(6000).milliseconds;
    _startTime = DateTime.now().duration();
    size = 0.2 + random.nextDouble() * 0.6;
  }

  /// 洗牌
  shuffle() {
    _startTime -= (random.nextDouble() * _duration.inSeconds).round().seconds;
  }

  checkIfParticleNeedsToBeRestarted() {
    if (progress() == 1.0) {
      restart();
    }
  }

  double progress() {
    return ((DateTime.now().duration() - _startTime) / _duration)
        .clamp(0.0, 1.0)
        .toDouble();
  }

}