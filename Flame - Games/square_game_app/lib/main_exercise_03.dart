import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(GameWidget(game: ComponentExample001()));
}

/// Polygon-based asteroid shape example
class Asteroid extends PositionComponent with HasGameRef<ComponentExample001> {
  final List<Vector2> vertices = [
    Vector2(0.2, 0.8),
    Vector2(-0.6, 0.6),
    Vector2(-0.8, 0.2),
    Vector2(-0.6, -0.4),
    Vector2(-0.4, -0.8),
    Vector2(0.0, -1.0),
    Vector2(0.4, -0.6),
    Vector2(0.8, -0.8),
    Vector2(1.0, 0.0),
    Vector2(0.4, 0.2),
    Vector2(0.7, 0.6),
  ];

  late PolygonComponent asteroid;
  Vector2 velocity = Vector2(0, 25);
  double rotationSpeed = 0.3;
  Paint paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    asteroid.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    angle = (angle - dt * rotationSpeed) % (2 * pi);

    if (Utils.isPositionOutOfBounds(gameRef.size, position)) {
      gameRef.remove(this);
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    asteroid = PolygonComponent.relative(
      vertices,
      parentSize: size,
      position: position,
      paint: paint,
    );
    anchor = Anchor.center;
  }
}

/// The game class
class ComponentExample001 extends FlameGame with DoubleTapDetector, TapCallbacks {
  bool running = true;

  @override
  bool get debugMode => false;

  final TextPaint textPaint = TextPaint(
    style: const TextStyle(fontSize: 14.0, fontFamily: 'Awesome Font'),
  );

  @override
  void onTapUp(TapUpEvent event) {
    final touchPoint = event.localPosition;
    print("<user tap> touchpoint: $touchPoint");

    final handled = children.any((component) {
      if (component is Asteroid && component.containsPoint(touchPoint)) {
        component.velocity.negate();
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
    textPaint.render(canvas, "objects active: ${children.length}", Vector2(10, 20));
    super.render(canvas);
  }
}
