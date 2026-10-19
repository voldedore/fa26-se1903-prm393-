import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_storage/providers/note_notifier.dart';
import 'package:local_storage/providers/shared_preferences_provider.dart';
import 'package:local_storage/ui/note_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Bảo đảm app Flutter sẽ được Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Lấy instance của shared preferences từ hệ thống
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      // Override lại provider của sharedPreferences (sharedPreferencesProvider)
      // Bằng value (instance của SP) vào trong data của provider.
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Notes management')),
        body: NoteListScreen(),

        // BAI TAP
        // Chuyen qua Screen AddNoteScreen
        // - 2 fields (title, content)
        // - Validation (title it nhat 3 ky tu, content it nhat 10 ky tu)
        // - Save button -> goi addNote cua note notifier
        // - route ve NoteListScreen

        // Edit & Delete
        // - Thêm 1 button edit -> EditNoteScreen
        // - Dialog Deletion Confirmation -> Delete/Cancel

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // handle them 1 note moi (gia lap value)
            // notifier notes -> addNote
            ref.read(noteProvider.notifier).addNote('New Note', 'This is the content');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
