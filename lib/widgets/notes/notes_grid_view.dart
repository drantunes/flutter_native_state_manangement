import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_filters.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_view_options.dart';
import 'package:flutter_native_state_manangement/providers/notes_filter_provider.dart';
import 'package:flutter_native_state_manangement/providers/notes_provider.dart';
import 'package:flutter_native_state_manangement/providers/notes_view_provider.dart';
import 'package:flutter_native_state_manangement/widgets/empty_notes.dart';
import 'package:flutter_native_state_manangement/widgets/notes/note_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesGridView extends StatefulWidget {
  const NotesGridView({Key? key}) : super(key: key);

  @override
  State<NotesGridView> createState() => _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  final duration = const Duration(milliseconds: 150);
  int columnsCount = 1;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: duration);
    animation.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotesViewProvider.of(context).addListener(runTransitionGridView);
  }

  runTransitionGridView() {
    animation.value = 0;

    Future.delayed(duration).then((value) {
      columnsCount = NotesViewProvider.of(context).value == NotesViewOptions.column ? 2 : 1;
      animation.forward();
    });
  }

  @override
  void dispose() {
    NotesViewProvider.of(context).removeListener(runTransitionGridView);
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notesRepository = NotesProvider.of(context);
    final notes = NotesFilterProvider.of(context).value == NotesFilters.inbox
        ? notesRepository.inboxNotes
        : notesRepository.archivedNotes;

    return notes.isEmpty
        ? const EmptyNotes()
        : AnimatedBuilder(
            animation: animation,
            builder: (context, _) => MasonryGridView.count(
              itemCount: notes.length,
              crossAxisCount: columnsCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (context, index) => AnimatedScale(
                scale: animation.value,
                duration: duration,
                child: NoteCard(
                  note: notes[index],
                ),
              ),
            ),
          );
  }
}
