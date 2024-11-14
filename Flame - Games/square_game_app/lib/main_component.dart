import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/asteroid.dart';

/// The game class
class MainComponent extends FlameGame with DoubleTapDetector, TapCallbacks {
  bool running = true;

  @override
  bool get debugMode => false;

  final TextPaint textPaint = TextPaint(
    style: const TextStyle(fontSize: 14.0, fontFamily: 'Awesome Font'),
  );

  @override
  void onTapUp(TapUpEvent event) {
    final Vector2 touchPoint = event.localPosition;

    final handled = children.any((component) {
      if (component is Asteroid && component.containsPoint(touchPoint)) {
        component.velocity.negate();
        component.processHit();
        return true;
      }
      return false;
    });

    if (!handled) {
      add(Asteroid()
        ..position = touchPoint
        ..size = Vector2(100, 100)
        ..velocity = Vector2(0, 1).normalized() * 25
        ..paint = (BasicPalette.red.paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1));
    }
  }

  @override
  void onDoubleTap() {
    running ? pauseEngine() : resumeEngine();
    running = !running;
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, "objects active: ${children.whereType<Asteroid>().length}", Vector2(10, 20));
    super.render(canvas);
  }
}
