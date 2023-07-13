import 'package:emoji_chess/board_provider.dart';
import 'package:flutter/material.dart';

class DraggableTile extends StatelessWidget {
  const DraggableTile({
    required this.tilePos,
  });

  final TilePos tilePos;

  @override
  Widget build(BuildContext context) {
    return Draggable<TilePos>(
      data: tilePos,
      onDragStarted: () {},
      onDragEnd: (details) {},
      onDragCompleted: () {},
      childWhenDragging: Container(
          color:
              tilePos.position.isWhiteTile() ? Colors.white70 : Colors.brown),
      feedback: Material(
        color: Colors.transparent,
        child: EmojiText(piece: tilePos.tile.piece?.emoji),
      ),
      child: Container(
        decoration: BoxDecoration(
            color:
                tilePos.position.isWhiteTile() ? Colors.white70 : Colors.brown,
            border: Border.all(width: 2, color: Colors.black)),
        alignment: Alignment.center,
        child: EmojiText(piece: tilePos.tile.piece?.emoji),
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
