import 'dart:async';

import 'package:flame/components.dart';

class UnitWidget extends SpriteComponent {
  UnitWidget(this.spritePath);

  final String spritePath;
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(50);
  }
}
