import 'package:flame/game.dart';
import 'package:fluppybird/components/background.dart';
import 'package:fluppybird/components/bird.dart';
import 'package:fluppybird/components/ground.dart';
import 'package:fluppybird/components/pipe_group.dart';

class FluppyBirdGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), PipeGroup()]);
  }
}