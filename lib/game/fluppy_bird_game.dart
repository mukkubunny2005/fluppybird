import 'package:flame/events.dart';
import 'package:flame/timer.dart';
import 'package:flame/game.dart';
import 'package:fluppybird/components/background.dart';
import 'package:fluppybird/components/bird.dart';
import 'package:fluppybird/components/configuration.dart';
import 'package:fluppybird/components/ground.dart';
import 'package:fluppybird/components/pipe_group.dart';

class FluppyBirdGame extends FlameGame with TapCallbacks, HasCollisionDetection {
  FluppyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(), 
      bird = Bird(), 
      PipeGroup(),

    ]);
    interval.onTick = () => add(PipeGroup());
    interval.start();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

}