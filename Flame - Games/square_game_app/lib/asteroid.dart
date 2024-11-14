import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/life_bar.dart';
import 'package:square_game_app/main_component.dart';
import 'package:square_game_app/utils.dart';

class Asteroid extends PositionComponent with HasGameRef<MainComponent> {
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

  late LifeBar lifeBar; 

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    asteroid.render(canvas);
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
    
    _createLifeBar();
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