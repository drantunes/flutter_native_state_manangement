import 'package:flutter/material.dart';

enum NotesViewOptions {
  column(icon: Icon(Icons.grid_view_rounded), tooltip: 'Grid View'),
  grid(icon: Icon(Icons.view_agenda_rounded), tooltip: 'Column View');

  const NotesViewOptions({required this.icon, required this.tooltip});

  final Icon icon;
  final String tooltip;
}
