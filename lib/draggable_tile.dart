import 'package:emoji_chess/util.dart';
import 'package:flutter/material.dart';

class DraggableTile extends StatelessWidget {
  const DraggableTile({
    required this.tile,
  });

  final Tile tile;

  @override
  Widget build(BuildContext context) {
    return Draggable<Tile>(
      data: tile,
      onDragStarted: () {},
      onDragEnd: (details) {},
      onDragCompleted: () {},
      childWhenDragging: Container(
          color: tile.position.isWhiteTile() ? Colors.white70 : Colors.brown),
      feedback: Material(
        color: Colors.transparent,
        child: EmojiText(piece: tile.piece?.emoji),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: tile.position.isWhiteTile() ? Colors.white70 : Colors.brown,
            border: Border.all(width: 2, color: Colors.black)),
        alignment: Alignment.center,
        child: EmojiText(piece: tile.piece?.emoji),
      ),
    );
  }
}

class EmojiText extends StatelessWidget {
  const EmojiText({
    this.piece,
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
