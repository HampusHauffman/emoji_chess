import 'package:emoji_chess/drag_target_tile.dart';
import 'package:emoji_chess/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board_provider.dart';

const emojiFont = 'NotoColorEmoji';

final boardProvider = StateNotifierProvider<BoardNotifier, Board>((ref) {
  return BoardNotifier.init();
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmojiChess',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          //set the font family for all the text widgets
          labelMedium: TextStyle(fontFamily: emojiFont, fontSize: 32),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var board = ref.watch(boardProvider);

    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        itemCount: 64,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return DragTargetTile(
            tile: (piece: board[index], position: index),
          );
        },
      ),
    );
  }
}
