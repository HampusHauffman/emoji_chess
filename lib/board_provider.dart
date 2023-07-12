import 'dart:core';

import 'package:emoji_chess/pieces/piece.dart';
import 'package:emoji_chess/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardNotifier extends StateNotifier<Board> {
  // init the board with 64 characters from the ascii table
  BoardNotifier.init() : super(createBoard());

  Piece? getPiece(int position) {
    return state[position];
  }
}

Board createBoard() {
  // create a board of the first 16 and last 16 values being cats and dogs
  return List.generate(64, (index) {
    if (index < 16) {
      return Dog();
    } else if (index > 47) {
      return Cat();
    } else {
      return null;
    }
  });
}
