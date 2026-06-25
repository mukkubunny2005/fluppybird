import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:fluppybird/components/birdmovement.dart';
import 'package:fluppybird/components/configuration.dart';
import 'package:fluppybird/game/assets.dart';
import 'package:fluppybird/game/fluppy_bird_game.dart';
import 'package:flutter/widgets.dart';

class Bird extends SpriteGroupComponent<Birdmovement> with HasGameReference<FluppyBirdGame>{
    Bird();
    @override
    Future<void> onLoad() async {
        final birdMidFlap = await game.loadSprite(Assets.birdMidFlap);
        final birdUpFlap = await game.loadSprite(Assets.birdUpFlap);
        final birdDownFlap = await game.loadSprite(Assets.birdDownFlap);
        size = Vector2(50, 40);
        position = Vector2(50, game.size.y / 2 - size.y / 2);
        
        sprites = {
            Birdmovement.middle : birdMidFlap,
            Birdmovement.up : birdUpFlap,
            Birdmovement.down : birdDownFlap,
        };
        current = Birdmovement.middle;
    }
    void fly() {
        add(
            MoveByEffect(
                Vector2(0, Config.gravity), 
                EffectController(duration: 0.2, curve: Curves.decelerate),
                onComplete: () => current = Birdmovement.down,
            )
        );
        current = Birdmovement.up;
    }
    @override
    void update(double dt) {
        super.update(dt);
        position.y += Config.birdVelocity * dt;
    }
}