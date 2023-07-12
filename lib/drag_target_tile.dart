import 'package:emoji_chess/draggable_tile.dart';
import 'package:emoji_chess/main.dart';
import 'package:emoji_chess/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DragTargetTile extends ConsumerWidget {
  const DragTargetTile({
    super.key,
    required this.position,
  });

  final Position position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(boardProvider);

    return Material(
      child: DragTarget<({Position position, String? piece})>(
        onWillAccept: (data) {
          if (data == null) return false;
          return onWillAccept(data, position, p);
        },
        onAccept: (data) {
          debugPrint("onAccept");
        },
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return DraggableTile(position: position);
        },
      ),
    );
  }

  bool onWillAccept(({Position position, String? piece}) data, Position position,
      List<String?> p) {
    var piece = data.piece;
    if (piece == null) return false;
    return p.canPieceMoveFromPos(data.position, position, piece);
  }
}
