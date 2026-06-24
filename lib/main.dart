import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

void main() {
  final game = FluppyBirdGame();

  runApp(
    GameWidget(
      game: game,
    ),
  );
}