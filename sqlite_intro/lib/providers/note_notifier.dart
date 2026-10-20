import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite_intro/model/note.dart';

part 'note_notifier.g.dart';

@riverpod
class NoteNotifier extends _$NoteNotifier {
@override
  List<Note> build() {
    return [];
  }

  // CRUD
  Future<void> addNote(String title, String content) async {
  }

  // Update
  Future<void> update(Note newNote) async {

  }
  // Delete
  Future<void> delete(int id) async {
  }
}