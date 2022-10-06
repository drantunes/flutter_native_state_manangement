import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_filters.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      const viewOption = NotesFilters.archived;
      final String noteType =
          viewOption == NotesFilters.archived ? 'Nenhuma nota arquivada.' : 'Crie sua primeira nota!';

      return Column(
        children: [
          Image.asset('assets/empty_notes.png'),
          Text(
            noteType,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      );
    });
  }
}
