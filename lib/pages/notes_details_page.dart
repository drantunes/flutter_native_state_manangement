import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/models/note.dart';
import 'package:flutter_native_state_manangement/providers/notes_provider.dart';

class NotesDetailsPage extends StatelessWidget {
  final Note note;

  const NotesDetailsPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = NotesProvider.of(context);
    return Scaffold(
      backgroundColor: note.color.shade50,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        actions: [
          !note.archived
              ? IconButton(
                  onPressed: () {
                    repository.archiveNote(note);
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.archive_rounded),
                )
              : IconButton(
                  onPressed: () {
                    repository.moveNoteToInbox(note);
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.undo),
                ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(height: 36),
            Text(note.description),
          ],
        ),
      ),
    );
  }
}
