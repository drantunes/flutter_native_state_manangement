import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_view_options.dart';
import 'package:flutter_native_state_manangement/widgets/common/custom_floating_button.dart';
import 'package:flutter_native_state_manangement/widgets/notes/add_note_sheet.dart';
import 'package:flutter_native_state_manangement/widgets/notes/bottom_navigation_widget.dart';
import 'package:flutter_native_state_manangement/widgets/notes/notes_grid_view.dart';

class NotesPage extends StatelessWidget {
  final viewMode = NotesViewOptions.inbox;
  final viewFilter = NotesViewOptions.archived;

  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        title: Text(viewFilter == NotesViewOptions.inbox ? 'Notas' : 'Arquivadas'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 36, left: 12, right: 12),
        child: NotesGridView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: CustomFloatingButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const AddNoteSheet(),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        buttons: [
          IconButton(
            tooltip: viewMode.tooltip,
            icon: viewMode.icon,
            onPressed: () => {},
          ),
          IconButton(
            tooltip: viewFilter.tooltip,
            icon: viewFilter.icon,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
