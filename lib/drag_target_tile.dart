import 'package:emoji_chess/board_provider.dart';
import 'package:emoji_chess/draggable_tile.dart';
import 'package:flutter/material.dart';

class DragTargetTile extends StatelessWidget {
  const DragTargetTile({
    required this.tile,
  });

  final TilePos tile;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DragTarget<TilePos>(
        onWillAccept: (data) {
          if (data == null) return false;
          return true;
        },
        onAccept: (data) {},
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return DraggableTile(tilePos: tile);
        },
      ),
    );
  }
}
