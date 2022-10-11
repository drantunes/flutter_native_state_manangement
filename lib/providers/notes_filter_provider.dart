import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/stores/notes_filter_store.dart';

class NotesFilterProvider extends InheritedNotifier<NotesFilterStore> {
  const NotesFilterProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static NotesFilterStore of(BuildContext context) {
    // TODO: Fazer a validação
    return context.dependOnInheritedWidgetOfExactType<NotesFilterProvider>()!.notifier!;
  }
}
