import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_filters.dart';

class NotesFilterStore extends ValueNotifier<NotesFilters> {
  NotesFilterStore() : super(NotesFilters.inbox);

  toggle() {
    value = value == NotesFilters.inbox ? NotesFilters.archived : NotesFilters.inbox;
  }
}
