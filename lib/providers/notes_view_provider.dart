import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/stores/notes_view_store.dart';

class NotesViewProvider extends InheritedNotifier<NotesViewStore> {
  const NotesViewProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static NotesViewStore of(BuildContext context) {
    // TODO: Fazer a validação
    return context.dependOnInheritedWidgetOfExactType<NotesViewProvider>()!.notifier!;
  }
}
