import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_view_options.dart';

class NotesViewStore extends ValueNotifier<NotesViewOptions> {
  NotesViewStore() : super(NotesViewOptions.grid);

  toggle() {
    value = value == NotesViewOptions.grid ? NotesViewOptions.column : NotesViewOptions.grid;
  }
}
