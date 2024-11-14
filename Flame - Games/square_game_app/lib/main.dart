import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:square_game_app/main_component.dart';

void main() {
  runApp(
    GameWidget(
      game: MainComponent(),
    ),
  );
}
