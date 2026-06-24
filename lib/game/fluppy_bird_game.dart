import 'package:flame/game.dart';
import 'package:fluppybird/components/background.dart';
import 'package:fluppybird/components/ground.dart';

class FluppyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground()]);
  }
}