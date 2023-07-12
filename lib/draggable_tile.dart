import 'package:emoji_chess/main.dart';
import 'package:emoji_chess/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggableTile extends ConsumerWidget {
  const DraggableTile({
    super.key,
    required this.position,
  });

  final Position position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(boardProvider);
    var draggablePiece = p[position];

    return Draggable<({Position position, String? piece})>(
      data: (position: position, piece: draggablePiece),
      onDragStarted: () {},
      onDragEnd: (details) {},
      onDragCompleted: () {},
      childWhenDragging: Container(
          color: position.isWhiteTile() ? Colors.white70 : Colors.brown),
      feedback: Material(
        color: Colors.transparent,
        child: EmojiText(piece: p[position]),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: position.isWhiteTile() ? Colors.white70 : Colors.brown,
            border: Border.all(width: 2, color: Colors.black)),
        alignment: Alignment.center,
        child: EmojiText(piece: p[position]),
      ),
    );
  }
}

class EmojiText extends StatelessWidget {
  const EmojiText({
    super.key,
    required this.piece,
  });

  final String? piece;

  @override
  Widget build(BuildContext context) {
    return Text(
      piece != null ? piece! : "",
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
