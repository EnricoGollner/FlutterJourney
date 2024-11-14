import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/life_bar.dart';

class Shape extends PositionComponent {
  Vector2 velocity = Vector2(0, 25);
  double rotationSpeed = 0.3;
  double squareSize = 128.0;
  Paint shapePaint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  late LifeBar lifeBar;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size.setValues(squareSize, squareSize);
    anchor = Anchor.center;
    _createLifeBar();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), shapePaint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    var angleDelta = dt * rotationSpeed;
    angle = (angle + angleDelta) % (2 * pi);
  }

  void _createLifeBar() {
    lifeBar = LifeBar.initData(size, size: Vector2(size.x - 10, 5), placement: LifeBarPlacement.center);
    //Add all lifebar element to the children of the Square instance
    add(lifeBar);
  }

  void processHit() {
    lifeBar.decrementCurrentLifeBy(15);
    if (lifeBar.currentLife <= 0) removeFromParent();
  }
}