import 'package:emoji_chess/drag_target_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board_provider.dart';

const emojiFont = "NotoColorEmoji";

final boardProvider =
    StateNotifierProvider<BoardNotifier, List<String?>>((ref) {
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
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        itemCount: 64,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return DragTargetTile(
            position: index,
          );
        },
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
      style: const TextStyle(fontSize: 30, fontFamily: emojiFont),
    );
  }
}
