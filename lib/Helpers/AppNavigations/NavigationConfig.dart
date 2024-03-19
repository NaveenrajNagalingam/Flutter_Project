

import 'package:notes_app/Pages/HomeScreen/HomeScreen.dart';
import 'package:notes_app/Pages/NotesEditorScreen/NotesEditorScreen.dart';
import 'package:notes_app/Pages/SearchNotesScreen/SearchNotesScreen.dart';
import 'package:notes_app/Pages/SplashScreen/SplashScreen.dart';

import 'NavigationHelpers.dart';

// ignore: constant_identifier_names
enum Routes {HomeScreen, NotesEditorScreen, SearchNotesScreen, SplashScreen}

class Pages {

  // Splash Screen Config
  static final PageConfig splashScreenConfig = PageConfig(
    route: Routes.SplashScreen,
    build: (_) => SplashScreen(extraData: splashScreenConfig.data));

  // Home Screen Config
  static final PageConfig homeScreenConfig = PageConfig(
    route: Routes.HomeScreen,
    build: (_) => HomeScreen(extraData: homeScreenConfig.data));

  // Notes Editor Screen Config
  static final PageConfig notesEditorScreenConfig = PageConfig(
    route: Routes.NotesEditorScreen,
    build: (_) => NotesEditorScreen(extraData: notesEditorScreenConfig.data));

  // Search Notes Screen Config
  static final PageConfig searchNotesScreenConfig = PageConfig(
    route: Routes.SearchNotesScreen,
    build: (_) => SearchNotesScreen(extraData: searchNotesScreenConfig.data));
}
