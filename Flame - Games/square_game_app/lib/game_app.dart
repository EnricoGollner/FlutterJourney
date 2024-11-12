import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/square.dart';

class GameApp extends FlameGame with DoubleTapDetector, TapCallbacks {
  bool _running = true;

  final TextPaint textPaint = TextPaint(
    style: const TextStyle(
      fontSize: 14,
      fontFamily: 'Awesome Font',
    ),
  );

  @override
  void onTapUp(TapUpEvent event) {
    final Vector2 touchPoint = event.localPosition;

    final bool handled = children.any((component) {
      if (component is Square && component.containsPoint(touchPoint)) {
        // remove(component);
        component.velocity.negate();
        return true;
      }
      return false;
    });

    if (!handled) {
      add(Square()
        ..position = touchPoint
        ..squareSize = 45.0
        ..velocity = Vector2(0, 1).normalized() * 50
        ..squarePaint = (BasicPalette.red.paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2));
    }
  }

  @override
  void onDoubleTap() {
    _running ? pauseEngine() : resumeEngine();
    _running = !_running;
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, 'Objects active: ${children.length}', Vector2(10, 40));
    super.render(canvas);
  }
}
