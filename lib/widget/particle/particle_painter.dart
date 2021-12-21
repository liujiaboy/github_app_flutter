import 'package:flutter/material.dart';
import 'package:github_app_flutter/widget/particle/particle_model.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/simple_animations.dart';


class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;
  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final _paint = Paint()..color = Colors.white.withAlpha(50);

    particles.forEach((p) {
      final _progress = p.progress();
      final MultiTweenValues<ParticleOffset> _animation = p.tween.transform(_progress);
      final _position = Offset(
        _animation.get<double>(ParticleOffset.x) * size.width,
        _animation.get<double>(ParticleOffset.y) * size.height
      );

      canvas.drawCircle(_position, size.width * 0.2 * p.size, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}