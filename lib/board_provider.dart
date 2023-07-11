import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardNotifier extends StateNotifier<List<String?>> {
  // init the board with 64 characters from the ascii table
  BoardNotifier.init() : super(List.generate(64, (index) => "$index"));

  String? getPiece(int position) {
    return state[position];
  }
}

@immutable
class Piece extends Equatable {
  final String? piece;
  final int row;
  final int col;

  const Piece({required this.piece, required this.row, required this.col});

  @override
  List<Object?> get props => [piece, row, col];
}

canPieceMove(int frow, int fcol, int trow, int tcol, String? piece) {
  if (piece == null) return false;
  if (frow == trow && fcol == tcol) {
    return false; // Cant move a piece to the same spot
  }
  return true;
}
