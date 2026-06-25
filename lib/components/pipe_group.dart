import 'package:flame/components.dart';
import 'package:fluppybird/components/pipe.dart';
import 'package:fluppybird/components/pipe_position.dart';

class PipeGroup extends PositionComponent {
  PipeGroup();

  @override
  Future<void> onLoad() async {
    addAll([
      Pipe(pipePositon: PipePosition.top, height: 100),
      Pipe(pipePositon: PipePosition.bottom, height: 200),
    ]);
  }
}