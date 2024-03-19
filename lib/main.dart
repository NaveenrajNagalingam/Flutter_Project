import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/App.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppConstants.dart';
import 'package:notes_app/Services/PlatformServices/PlatformHiveLocalDbService/PlatformHiveLocalDbService.dart';

void main() async{
  print("Main function called");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  await initServices();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesBOAdapter());
  var box = await Hive.openBox('myBox');
  AppConstants.hiveNotesBox = box;
  runApp(const App());
}

Future<void> initServices() async {
  final getItInstance = GetIt.instance;
  getItInstance.registerFactory<PlatformHiveLocalDbService>(() => PlatformHiveLocalDbService());
}