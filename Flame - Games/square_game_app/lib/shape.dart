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
  // render the shape
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), shapePaint);
  }

  @override
  // update the inner state of the shape
  // in our case the position
  void update(double dt) {
    super.update(dt);
    // speed is refresh frequency independent
    position += velocity * dt;
    // add rotational speed update as well
    var angleDelta = dt * rotationSpeed;
    angle = (angle + angleDelta) % (2 * pi);
  }

  // Create a rudimentary lifebar shape
  void _createLifeBar() {
    lifeBar = LifeBar.initData(size, size: Vector2(size.x - 10, 5), placement: LifeBarPlacement.center);
    //Add all lifebar element to the children of the Square instance
    add(lifeBar);
  }

  /// Method for communicating life state information to the class object
  void processHit() {
    lifeBar.decrementCurrentLifeBy(10);
    if (lifeBar.currentLife <= 0) removeFromParent();
  }
}