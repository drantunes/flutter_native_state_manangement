import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_state_manangement/enums/notes/notes_filters.dart';
import 'package:flutter_native_state_manangement/providers/notes_filter_provider.dart';
import 'package:flutter_native_state_manangement/providers/notes_view_provider.dart';
import 'package:flutter_native_state_manangement/theme/custom_theme.dart';
import 'package:flutter_native_state_manangement/widgets/common/custom_floating_button.dart';
import 'package:flutter_native_state_manangement/widgets/notes/add_note_sheet.dart';
import 'package:flutter_native_state_manangement/widgets/notes/bottom_navigation_widget.dart';
import 'package:flutter_native_state_manangement/widgets/notes/notes_grid_view.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesFilter = NotesFilterProvider.of(context).value;
    final viewMode = NotesViewProvider.of(context).value;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        title: Text(notesFilter == NotesFilters.inbox ? 'Notas' : 'Arquivadas'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: CustomTheme.black,
        ),
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
            onPressed: () => NotesViewProvider.of(context).toggle(),
          ),
          IconButton(
            tooltip: notesFilter.tooltip,
            icon: notesFilter.icon,
            onPressed: () => NotesFilterProvider.of(context).toggle(),
          ),
        ],
      ),
    );
  }
}
