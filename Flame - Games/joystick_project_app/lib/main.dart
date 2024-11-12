import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';

import 'bullet.dart';
import 'joystick_player.dart';

void main() {
  runApp(
    GameWidget(game:  MainGame()),
  );
}

class MainGame extends FlameGame with TapCallbacks {
  //The player being controlled by Joystick
  late final JoystickPlayer player;
  //The actual Joystick component
  late final JoystickComponent joystick;
  //Angle of the ship being displayed on canvas
  final TextPaint shipAngleTextPaint = TextPaint();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //
    // joystick knob and background skin styles
    final knobPaint = BasicPalette.green.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.green.withAlpha(100).paint();
    //
    // Actual Joystick component creation
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 15, paint: knobPaint),
      background: CircleComponent(radius: 50, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );

    // adding the player that will be controlled by our joystick
    player = JoystickPlayer(joystick);

    // add both joystick and the controlled player to the game instance
    add(player);
    add(joystick);
  }

  @override
  void update(double dt) {
    //  show the angle of the player
    debugPrint("current player angle: ${player.angle}");
    super.update(dt);
  }


  @override
  void onTapUp(TapUpEvent event) {
    final Vector2 velocity = Vector2(0, -1);
    velocity.rotate(player.angle);
    add(Bullet(player.position, velocity));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    //
    // render the angle in radians for reference
    shipAngleTextPaint.render(
      canvas,
      '${player.angle.toStringAsFixed(5)} radians',
      Vector2(20, size.y - 24),
    );
  }
}
