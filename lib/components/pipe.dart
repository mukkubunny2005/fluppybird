import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:fluppybird/components/configuration.dart';
import 'package:fluppybird/components/pipe_position.dart';
import 'package:fluppybird/game/assets.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

class Pipe extends SpriteComponent with HasGameReference<FluppyBirdGame> {
  Pipe({
    required this.pipePositon, required this.height
  });
  @override
  final double height;
  final PipePosition pipePositon;
  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);
    switch (pipePositon){
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = game.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}