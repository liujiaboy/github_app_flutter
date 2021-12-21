import 'dart:math';

import 'package:flutter/material.dart';
import 'package:github_app_flutter/widget/particle/particle_model.dart';
import 'package:github_app_flutter/widget/particle/particle_painter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

class ParticleWidget extends StatefulWidget {
  final int numberOfParticles;
  const ParticleWidget({Key? key, required this.numberOfParticles}) : super(key: key);

  @override
  _ParticleWidgetState createState() => _ParticleWidgetState();
}

class _ParticleWidgetState extends State<ParticleWidget>
  with WidgetsBindingObserver {

  final Random _random = Random();
  final List<ParticleModel> _particles = [];

  @override
  void initState() {
    super.initState();
    widget.numberOfParticles.times(() {
      _particles.add(ParticleModel(_random));
    });
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 后台切换到前台
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _particles.forEach((element) {
        element.restart();
        element.shuffle();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return LoopAnimation(builder: (
        BuildContext context, Widget? child, dynamic _) {
      _simulateParticles();
      return CustomPaint(
        painter: ParticlePainter(_particles),
      );
    }, tween: ConstantTween(1),
    );
  }

  _simulateParticles() {
    _particles
        .forEach((particle) => particle.checkIfParticleNeedsToBeRestarted());
  }
}
