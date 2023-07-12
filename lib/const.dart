import 'package:emoji_chess/util.dart';

enum Pieces {
  cat('🐱', _catMove),
  dog('🐶', _catMove);

  final String emoji;
  final bool Function(Board board, Position from, Position to) move;
  const Pieces(this.emoji, this.move);
}

bool _catMove(Board board, Position from, Position to) {
  return false;
}
