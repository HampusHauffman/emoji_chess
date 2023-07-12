import 'package:emoji_chess/pieces/piece.dart';

typedef Board = List<Piece?>;
typedef Position = int;
typedef Tile = ({Piece? piece, Position position});

extension BoardPosition on Position {
  Position row() {
    return this ~/ 8;
  }

  Position col() {
    return this % 8;
  }

  bool isWhiteTile() =>
      ((this ~/ 8) % 2 == 0) ? (this % 2 == 0) : (this % 2 != 0);
}
