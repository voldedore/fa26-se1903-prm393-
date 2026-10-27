import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlite_intro/providers/note_notifier.dart';

import '../model/note.dart';

class NoteListScreen extends ConsumerStatefulWidget {
  const NoteListScreen({super.key});

  @override
  ConsumerState<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends ConsumerState<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    // Luu y: ref.watch(noteProvider) se tra ve state
    // state
    final notesAsyncVal = ref.watch(noteProvider);
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Introduction")),
      body:
          // notesAsyncVal = Future<List<Note>>
          // .when có 3 stages: loading: trong lúc tải, error: khi có lỗi, data: load xong
          notesAsyncVal.when(
            data: (notes) => notes.isEmpty
                ? Text('There is no notes. Please create one.')
                : GridView.builder(
                    // GridView builder
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                        ),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Card(
                        child: Column(
                          children: [
                            Text(note.title),
                            Text(note.content),
                            IconButton(
                              onPressed: () {
                                // dialog
                                // notifier
                                ref.read(noteProvider.notifier).delete(note.id!);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            error: (err, stack) => Text('There is an error loading notes'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // route qua screen NoteAddScreen
          ref
              .read(noteProvider.notifier)
              .addNote(Note(title: 'Note title', content: 'Content'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
