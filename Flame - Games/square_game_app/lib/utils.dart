import 'dart:math';

import 'package:flame/game.dart';

class Utils {
  ///* `screenSize` - How large the screen is
  ///* `screenSize` - How far away from the edge we are going to generate our random position
  static Vector2 generateRandomPosition(Vector2 screenSize, Vector2 margins) {
    final Random random = Random();
    Vector2 result = Vector2.zero();

    result = Vector2(
      (random.nextInt(screenSize.x.toInt()) - 2 * margins.x.toInt()).toDouble() + margins.x,
      (random.nextInt(screenSize.y.toInt()) - 2 * margins.y.toInt()).toDouble() + margins.y,
    );

    return result;
  }

  static Vector2 generateRandomVelocity(Vector2 screenSize, int min, int max) {
    final Random random = Random();
    Vector2 result = Vector2.zero();
    double velocity = 0;

    while (result == Vector2.zero()) {
      result = Vector2(
        (random.nextInt(3) - 1) * random.nextDouble(),
        (random.nextInt(3) - 1) * random.nextDouble(),
      );
    }
    result.normalize();
    velocity = (random.nextInt(max - min) + min).toDouble();

    return result * velocity;
  }

  static bool isPositionOutOfBonds(Vector2 bounds, Vector2 position) {
    bool result = false;

    result = position.x >= bounds.x || position.x <= 0
    || position.y >= bounds.y || position.y <= 0;

    return result;
  }
}