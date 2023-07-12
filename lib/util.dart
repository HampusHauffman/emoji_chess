typedef Board = List<String?>;
typedef Position = int;

extension BoardPosition on Position {
  int row() {
    return this ~/ 8;
  }

  int col() {
    return this % 8;
  }

  bool isWhiteTile() =>
      ((this ~/ 8) % 2 == 0) ? (this % 2 == 0) : (this % 2 != 0);
}

extension Movement on Board {
  bool canPieceMoveFromRowCol(
      int fromRow, int fromCol, int toRow, int toCol, String piece) {
    if (fromRow == toRow && fromCol == toCol) {
      return false; // Cant move a piece to the same spot
    }
    return true;
  }

  bool canPieceMoveFromPos(int fromPosition, int toPosition, String piece) {
    return canPieceMoveFromRowCol(fromPosition.row(), fromPosition.col(),
        toPosition.row(), toPosition.col(), piece);
  }
}
