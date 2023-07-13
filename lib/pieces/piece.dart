import 'package:emoji_chess/board_provider.dart';

abstract class Piece {
  final String name;
  final String emoji;
  bool canMove(Board board, Position from, Position to);
  void onEvent(String event);

  Piece({required this.name, required this.emoji});
}

class Cat implements Piece {
  @override
  bool canMove(Board board, Position from, Position to) {
    return true;
  }

  @override
  String emoji = '🐈';

  @override
  String name = "Cat";

  @override
  void onEvent(String event) {}
}

class Dog implements Piece {
  @override
  bool canMove(Board board, Position from, Position to) {
    return false;
  }

  @override
  String emoji = '🐕';

  @override
  String name = "Dog";

  @override
  void onEvent(String event) {}
}
