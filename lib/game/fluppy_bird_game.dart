import 'package:flame/events.dart';
import 'package:flame/timer.dart';
import 'package:flame/game.dart';
import 'package:fluppybird/components/background.dart';
import 'package:fluppybird/components/bird.dart';
import 'package:fluppybird/components/configuration.dart';
import 'package:fluppybird/components/ground.dart';
import 'package:fluppybird/components/pipe_group.dart';

class FluppyBirdGame extends FlameGame with TapCallbacks {
  FluppyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(), 
      bird = Bird(), 
      PipeGroup(),

    ]);
    bird.fly();
    interval.onTick = () => add(PipeGroup());
  }

  void onTap() {
    bird.fly();
  }
  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

}