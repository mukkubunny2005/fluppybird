import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fluppybird/game/assets.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

class Background extends SpriteComponent with HasGameReference<FluppyBirdGame> {
  Background();
  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = game.size;
    sprite = Sprite(background);
    
  }
}