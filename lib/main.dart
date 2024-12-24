import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:king_board_game/level_game.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  static Vector2 sceneSize = Vector2(400, 400);
  late CameraComponent cameraComponent;

  @override
  Future<void> onLoad() async {
    final LevelGame levelGame = LevelGame();

    cameraComponent = CameraComponent.withFixedResolution(
      world: levelGame,
      width: sceneSize.x,
      height: sceneSize.y,
    );

    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    addAll([
      cameraComponent,
      levelGame,
    ]);
  }

  @override
  Color backgroundColor() => Colors.green.shade800;
}
