import 'package:flame/components.dart';
import 'package:fluppybird/components/birdmovement.dart';
import 'package:fluppybird/game/assets.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';

class Bird extends SpriteGroupComponent<Birdmovement> with HasGameReference<FluppyBirdGame>{
    Bird();
    @override
    Future<void> onLoad() async {
        final birdMidFlap = await game.loadSprite(Assets.birdMidFlap);
        final birdUpFlap = await game.loadSprite(Assets.birdUpFlap);
        final birdDownFlap = await game.loadSprite(Assets.birdDownFlap);
        size = Vector2(50, 40);
        position = Vector2(50, game.size.y);
        current = Birdmovement.middle;
        sprites = {
            Birdmovement.middle : birdMidFlap, 
            Birdmovement.down : birdDownFlap,
            Birdmovement.up : birdUpFlap
        };
    }
}