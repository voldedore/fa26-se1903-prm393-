import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/db/database_helper.dart';
import 'package:sqlite_intro/model/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
  @override
  Future<List<Note>> build() async {
    return DatabaseHelper.instance.getAll();
  }

  // CRUD
  Future<void> addNote(Note note) async {
    await DatabaseHelper.instance.insert(note);
    ref.invalidateSelf(); // state invalidate va chay laij build()
    await future;
  }

  // Update
  // Future<void> update(Note newNote) async {}

  // Delete
  // Future<void> delete(int id) async {}
}
