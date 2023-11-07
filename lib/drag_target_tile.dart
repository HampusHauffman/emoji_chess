import 'package:emoji_chess/board_provider.dart';
import 'package:emoji_chess/draggable_tile.dart';
import 'package:emoji_chess/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DragTargetTile extends ConsumerWidget {
  const DragTargetTile({
    required this.position,
  });

  final Position position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var board = ref.watch(boardProvider.notifier);
    var a = ref.watch(boardProvider);

    return Material(
      child: DragTarget<Position>(
        onWillAccept: (data) {
          if (data == null) return false;
          return true;
        },
        onAccept: (fromPosition) {
          debugPrint("onAccept $fromPosition $position");
          board.move(fromPosition, position);
        },
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return DraggableTile(position: position);
        },
      ),
    );
  }
}
