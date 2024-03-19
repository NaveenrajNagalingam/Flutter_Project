import 'package:get_it/get_it.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppConstants.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:notes_app/Services/PlatformServices/PlatformHiveLocalDbService/PlatformHiveLocalDbService.dart';

class HomeScreenVM extends HomeScreenModel{

  final PlatformHiveLocalDbService hiveDbService = GetIt.instance.get<PlatformHiveLocalDbService>();

  void navigateToEditorScreen(NotesBO notesBO){
    try{
      navigationStream.add(NavigatorPush(
        pageConfig: Pages.notesEditorScreenConfig, data: notesBO
      ));
    }
    catch(exception){
      print(exception);
    }
  }

  void navigateToSearchScreen(){
    try{
      navigationStream.add(NavigatorPush(
        pageConfig: Pages.searchNotesScreenConfig, data: notes
      ));
    }
    catch(exception){
      print(exception);
    }
  }

  Future<List<NotesBO>> getAllNotesfromHive() async{
    List<NotesBO> myNotes = [];
    var response = await hiveDbService.getAllNotes();
    myNotes = response.content??[];
    myNotes.isNotEmpty ? setBoolValue(true) : setBoolValue(false);
    setNotesValue([...myNotes]);
    AppConstants.notesList = myNotes;
    return myNotes;
  }

  Future<bool?> removeNotesfromHive(int id) async{
    var response = await hiveDbService.deleteNotes(key: id);
    notes.removeWhere((note) => note.id == id);
    return response.content;
  }

  void function1(){

  }

  void function2(){
    
  }

  void function3(){
    
  }

  void function4(){
    
  }
  void function5(){
    
  }
  void function6(){
    
  }
  void function7(){
    
  }
  void function8(){
    
  }

  void function9(){
    
  }

  void function10(){
    
  }

  void function11(){
    
  }

  void function12(){
    
  }

  void function13(){
    
  }

  void function14(){
    
  }

  void function15(){
    
  }

}