import 'package:flutter_native_state_manangement/models/note.dart';

class NotesRepository {
  List<Note> value = [];

  NotesRepository();

  addNote(Note note) {
    value = [...value, note];
  }

  archiveNote(Note note, [archive = true]) {
    final updatedNote = note.copyWith(archived: archive);
    value.remove(note);
    value = [updatedNote, ...value];
  }

  moveNoteToInbox(Note note) {
    archiveNote(note, false);
  }
}
