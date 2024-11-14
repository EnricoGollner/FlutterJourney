import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/shape.dart';
import 'package:square_game_app/utils.dart';

void main() {
  runApp(GameWidget(game: MainGame()));
}

class MainGame extends FlameGame with DoubleTapDetector, TapCallbacks {
  //Controls if the engine is paused or not
  bool running = true;
  @override
  bool get debugMode => false;

  //Text rendering const
  final TextPaint textPaint = TextPaint(
    style: const TextStyle(
      fontSize: 14.0,
      fontFamily: 'Awesome Font',
    ),
  );

  @override
  void onTapUp(TapUpEvent event) {
    final Vector2 touchPoint = event.localPosition;

    //Handle the tap action
    //
    //Check if the tap location is within any of the shapes on the screen
    //and if so remove the shape from the screen
    final handled = children.any((component) {
      if (component is Shape && component.containsPoint(touchPoint)) {
        //remove(component);
        component.processHit();
        component.velocity.negate();
        return true;
      }
      return false;
    });

    if (!handled) {
      add(Shape()
        ..position = touchPoint
        ..squareSize = 45.0
        ..velocity = Vector2(0, 1).normalized() * 25
        ..shapePaint = (Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2));
    }
  }

  @override
  void onDoubleTap() {
    running
      ? pauseEngine()
      : resumeEngine();

    running = !running;
  }

  @override
  void update(double dt) {
    super.update(dt);
    children.whereType<Shape>().forEach((component) {
      if (Utils.isPositionOutOfBonds(size, component.position)) remove(component);
    });
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, "objects active: ${children.whereType<Shape>().length}", Vector2(10, 24));
    super.render(canvas);
  }
}
