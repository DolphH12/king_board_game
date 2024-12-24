import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameBoard extends Component {
  final int rows = 8;
  final int cols = 8;
  final double cellSize = 50;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        final rect = Rect.fromLTWH(
          col * cellSize,
          row * cellSize,
          cellSize,
          cellSize,
        );

        final paint = Paint()..color = Colors.white;
        paint.style = PaintingStyle.stroke;
        canvas.drawRect(rect, paint);
      }
    }
  }
}
