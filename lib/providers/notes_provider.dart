import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/repositories/notes_repository.dart';

class NotesProvider extends InheritedNotifier<NotesRepository> {
  const NotesProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static NotesRepository of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotesProvider>()!.notifier!;
  }
}
