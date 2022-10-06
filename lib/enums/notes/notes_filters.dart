import 'package:flutter/material.dart';

enum NotesFilters {
  inbox(icon: Icon(Icons.archive_rounded), tooltip: 'Show Archive'),
  archived(icon: Icon(Icons.inbox_rounded), tooltip: 'Show Inbox');

  const NotesFilters({required this.icon, required this.tooltip});

  final Icon icon;
  final String tooltip;
}
