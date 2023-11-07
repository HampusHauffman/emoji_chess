import 'dart:core';

import 'package:collection/collection.dart';
import 'package:emoji_chess/pieces/piece.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef Position = int;

extension BoardPosition on Position {
  Position row() => this ~/ 8;
  Position col() => this % 8;
  bool isWhiteTile() =>
      ((this ~/ 8) % 2 == 0) ? (this % 2 == 0) : (this % 2 != 0);
}

class Tile {
  Piece? piece;
  Tile({this.piece});
}

// Representation of a tile at a position
typedef TilePos = ({Tile tile, Position position});

class Board {
  final List<Tile> _tiles;

  Board({required List<Tile> tiles}) : _tiles = tiles;

  Board.createBoard()
      : _tiles = List.unmodifiable(List.generate(64, (index) {
          if (index < 16) {
            return Tile(piece: Dog());
          } else if (index > 47) {
            return Tile(piece: Cat());
          } else {
            return Tile();
          }
        }));

  TilePos operator [](int index) => (tile: _tiles[index], position: index);
  void operator []=(int index, Piece piece) => _tiles[index].piece = piece;
}

class BoardNotifier extends StateNotifier<Board> {
  // init the board with 64 characters from the ascii table
  BoardNotifier.init() : super(Board.createBoard());

  TilePos getPiece(int position) {
    return state[position];
  }

  void move(Position from, Position to) {
    //implement the logic of moving a piece from one position to another
    state[to].tile.piece = state[from].tile.piece;
    state[from].tile.piece = null;
  }
}
