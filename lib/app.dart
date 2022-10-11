import 'package:flutter/material.dart';
import 'package:flutter_native_state_manangement/pages/notes_page.dart';
import 'package:flutter_native_state_manangement/providers/notes_filter_provider.dart';
import 'package:flutter_native_state_manangement/providers/notes_provider.dart';
import 'package:flutter_native_state_manangement/providers/notes_view_provider.dart';
import 'package:flutter_native_state_manangement/repositories/notes_repository.dart';
import 'package:flutter_native_state_manangement/stores/notes_filter_store.dart';
import 'package:flutter_native_state_manangement/stores/notes_view_store.dart';
import 'package:flutter_native_state_manangement/theme/custom_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotesProvider(
      notifier: NotesRepository(),
      child: MaterialApp(
        title: 'Flutter SM Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: CustomTheme.black,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: CustomTheme.elevatedButtonStyle,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: CustomTheme.black,
          ),
        ),
        home: NotesViewProvider(
          notifier: NotesViewStore(),
          child: NotesFilterProvider(
            notifier: NotesFilterStore(),
            child: const NotesPage(),
          ),
        ),
      ),
    );
  }
}
