import 'package:emoji_chess/board_provider.dart';
import 'package:emoji_chess/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggableTile extends StatelessWidget {
  const DraggableTile({
    required this.position,
  });

  final Position position;

  @override
  Widget build(BuildContext context) {
    return Draggable<Position>(
      data: position,
      onDragStarted: () {},
      onDragEnd: (details) {},
      onDragCompleted: () {},
      childWhenDragging: Container(
          color: position.isWhiteTile() ? Colors.white70 : Colors.brown),
      feedback: Material(
        color: Colors.transparent,
        child: EmojiText(position: position),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: position.isWhiteTile() ? Colors.white70 : Colors.brown,
            border: Border.all(width: 2, color: Colors.black)),
        alignment: Alignment.center,
        child: EmojiText(position: position),
      ),
    );
  }
}

class EmojiText extends ConsumerWidget {
  final Position position;

  EmojiText({required this.position});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var board = ref.watch(boardProvider);
    var piece = board[position].tile.piece;

    return Text(
      piece != null ? piece.emoji : "",
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
