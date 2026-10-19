import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/note_notifier.dart';

class NoteListScreen extends ConsumerStatefulWidget {
  const NoteListScreen({super.key});

  @override
  ConsumerState<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends ConsumerState<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(noteProvider);

    return GridView.count(
      crossAxisCount: 2,
      children:
        notes.map((n) => Card(
          child: Column(
            children: [
              Text(n.title),
              Text(n.content),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        )).toList()
      // [
      //   Card(
      //     child: Column(
      //       children: [
      //         Text('Note 1'),
      //         Text('Content of note 1'),
      //         IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      //       ],
      //     ),
      //   ),
      //   Card(
      //     child: Column(
      //       children: [
      //         Text('Note 1'),
      //         Text('Content of note 1'),
      //         IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      //       ],
      //     ),
      //   ),
      //   Card(
      //     child: Column(
      //       children: [
      //         Text('Note 1'),
      //         Text('Content of note 1'),
      //         IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      //       ],
      //     ),
      //   ),
      // ],
    );
  }
}
