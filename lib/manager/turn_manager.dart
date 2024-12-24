class TurnManager {
  bool isPlayerTurn = true;

  void endTurn() {
    isPlayerTurn = false;
  }

  void startTurn() {
    isPlayerTurn = true;
  }
}
