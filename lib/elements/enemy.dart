import 'package:flame/components.dart';
import 'package:king_board_game/elements/unit_widget.dart';

class Enemy extends UnitWidget {
  Enemy() : super('death.png');

  void moveTowards(Vector2 targetPosition) {
    if (position.x < targetPosition.x) {
      position.x += 50;
    }
    if (position.x > targetPosition.x) {
      position.x -= 50;
    }
    if (position.y < targetPosition.y) {
      position.y += 50;
    }
    if (position.y > targetPosition.y) {
      position.y -= 50;
    }
  }
}
