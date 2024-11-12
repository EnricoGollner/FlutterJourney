import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Square extends PositionComponent {
  Vector2 velocity = Vector2(0, 0).normalized() * 25;
  double rotationSpeed = 0.3;
  double squareSize = 128.0;
  Paint squarePaint = BasicPalette.white.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  List<RectangleComponent> _lifeBarElements = List<RectangleComponent>.filled(
    3,
    RectangleComponent(size: Vector2(1, 1)),
    growable: true,
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(squareSize, squareSize);
    anchor = Anchor.center;
    _createLifeBar();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    double angleDelta = dt * rotationSpeed;
    angle = (angle + angleDelta) % (2 * pi); //modulus of 2 * pi (360°) to keep the actual number of radians within the 360 degree confine.
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), squarePaint);
  }

  void _createLifeBar() {
    Vector2 lifeBarSize = Vector2(40, 10);
    Paint backgroundFillColor = Paint()
      ..color = Colors.grey.withOpacity(0.35)
      ..style = PaintingStyle.fill;
    Paint outlineColor = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke;
    Paint lifeDangerColor = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    _lifeBarElements = [
      //The outline of the life bar
      //Calculate the position to seems to be above the square
      // x = (parent's widget width - child's width)
      //y = as we want it to be seeming to be above, we use the negative coordinate for this child's height, being: -height - 2 (-2 because we're adding 2 to the negative coordinate to be a little bit above) 
      RectangleComponent(
        position: Vector2(size.x - 40, -10 - 2),
        size: lifeBarSize,
        angle: 0,
        paint: outlineColor,
      ),
      RectangleComponent(
        position: Vector2(size.x - lifeBarSize.x, -lifeBarSize.y - 2),
        size: lifeBarSize,
        angle: 0,
        paint: backgroundFillColor,
      ),
      RectangleComponent(
        position: Vector2(size.x - lifeBarSize.x, -lifeBarSize.y - 2),
        size: Vector2(10, 10),
        angle: 0,
        paint: lifeDangerColor,
      ),
    ];

    addAll(_lifeBarElements);
  }
}
