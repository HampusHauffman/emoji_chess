import 'package:emoji_chess/draggable_tile.dart';
import 'package:emoji_chess/util.dart';
import 'package:flutter/material.dart';

class DragTargetTile extends StatelessWidget {
  const DragTargetTile({
    required this.tile,
  });

  final Tile tile;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DragTarget<({Position position, String? piece})>(
        onWillAccept: (data) {
          if (data == null) return false;
          return true;
        },
        onAccept: (data) {
          debugPrint("onAccept");
        },
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return DraggableTile(tile: tile);
        },
      ),
    );
  }
}
