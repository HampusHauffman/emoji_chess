enum Pieces {
  cat('🐱', _catMove),
  dog('🐶', _catMove);

  final String emoji;
  final bool Function(List<String?> board, int from, int to) move;
  const Pieces(this.emoji, this.move);
}

bool _catMove(List<String?> board, int from, int to) {
  return false;
}

final List<String> pieces = [
  '🐱',
  '🐶',
  '🐭',
  '🐹',
  '🐰',
  '🦊',
  '🐻',
  '🐼',
  '🐻',
  '🐨',
  '🐯',
  '🦁',
  '🐮',
  '🐷',
  '🐸',
  '🐵',
  '🙈',
  '🙉',
  '🙊',
  '🐔',
  '🐧',
  '🐦',
  '🐤',
  '🐣',
  '🐥',
  '🦆',
];
