import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:king_board_game/elements/enemy.dart';
import 'package:king_board_game/elements/unit_widget.dart';
import 'package:king_board_game/game_board.dart';
import 'package:king_board_game/manager/turn_manager.dart';

import 'elements/king.dart';

class LevelGame extends World with TapCallbacks, HasGameRef {
  late GameBoard gameBoard;
  late King king;
  late UnitWidget castle;
  late List<Enemy> enemies;
  late TurnManager turnManager;

  @override
  Future<void> onLoad() async {
    gameBoard = GameBoard();
    add(gameBoard);

    castle = UnitWidget('castle.png')..position = Vector2(350, 350);
    add(castle);

    king = King()..position = Vector2(50, 50);
    add(king);

    enemies = [
      //Enemy()..position = Vector2(350, 150),
    ];

    for (var enemy in enemies) {
      add(enemy);
    }

    turnManager = TurnManager();

    turnManager.startTurn();
  }

  void handleEnemyTurn() {
    for (var enemy in enemies) {
      enemy.moveTowards(king.position);
    }

    turnManager.startTurn();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    final col = (event.localPosition.x / gameBoard.cellSize).floor();
    final row = (event.localPosition.y / gameBoard.cellSize).floor();

    final targetPosition = Vector2(
      col * gameBoard.cellSize,
      row * gameBoard.cellSize,
    );

    if ((targetPosition - king.position).length <= gameBoard.cellSize * 1.5) {
      king.position = targetPosition;
      turnManager.endTurn();
      handleEnemyTurn();
    }
  }

  void checkGameState() {
    if ((king.position - castle.position).length <= 10) {
      print('You win!');
      game.pauseEngine();
    }

    for (var enemy in enemies) {
      if ((king.position - enemy.position).length <= 10) {
        print('You lose!');
        game.pauseEngine();
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    checkGameState();
  }
}
