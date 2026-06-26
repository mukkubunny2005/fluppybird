import 'package:fluppybird/screens/game_over_Screen.dart';
import 'package:fluppybird/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

void main() {
  final game = FluppyBirdGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu' : (context, _) => MainMenuScreen(game: game),
        'gameOver' : (context, _) => GameOverScreen(game: game)
      },
    ),
  );
}