import 'dart:math';

import 'package:flame/components.dart';
import 'package:fluppybird/components/configuration.dart';
import 'package:fluppybird/components/pipe.dart';
import 'package:fluppybird/components/pipe_position.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

class PipeGroup extends PositionComponent with HasGameReference<FluppyBirdGame> {
  PipeGroup();

  final _random = Random();
  @override
  Future<void> onLoad() async {
    position.x = game.size.x;
    final heightMinusGround = game.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePositon: PipePosition.top, height: centerY - spacing / 2),
      Pipe(pipePositon: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }
  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
    if(position.x < -10){
      removeFromParent();
    }
  }
}