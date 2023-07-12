import 'dart:core';

import 'package:emoji_chess/const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardNotifier extends StateNotifier<List<String?>> {
  // init the board with 64 characters from the ascii table
  BoardNotifier.init()
      : super(List.generate(64, (index) => Pieces.values[index % 2].emoji));

  String? getPiece(int position) {
    return state[position];
  }
}
