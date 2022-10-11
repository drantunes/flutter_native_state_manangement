import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/models/note.dart';

class NotesRepository extends ChangeNotifier {
  List<Note> _notes = [];

  UnmodifiableListView<Note> get inboxNotes => UnmodifiableListView(_notes.where((note) => !note.archived));
  UnmodifiableListView<Note> get archivedNotes => UnmodifiableListView(_notes.where((note) => note.archived));

  addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  archiveNote(Note note, [archive = true]) {
    final updatedNote = note.copyWith(archived: archive);
    _notes.remove(note);
    _notes = [updatedNote, ..._notes];
    notifyListeners();
  }

  moveNoteToInbox(Note note) {
    archiveNote(note, false);
  }
}
