import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppConstants.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Pages/SearchNotesScreen/SearchNotesScreenModel.dart';

class SearchNotesScreenVM extends SearchNotesScreenModel{
  void searchNotes(String searchValue){
    try{
      if(searchValue.isEmpty){
        setSearchListValue([]);
        return;
      }

      List<NotesBO> searchResponse = [];
      searchResponse = AppConstants.notesList.where((note) {
        if (note.title.contains(searchValue) || note.description.contains(searchValue)) {
          searchResponse.add(note);
          return true; // Return true to include the note in the filtered list
        }
        return false; // Return false to exclude the note from the filtered list
      }).toList(); // Convert the result to a list if needed
      setSearchListValue(searchResponse);

      if(searchValue.isNotEmpty && searchList.isEmpty){
        setMatchFoundValue(false);
        return;
      }
      setMatchFoundValue(true);
    }
    catch(exception){
      print(exception);
    }
  }

  void clearSearchText(){
    try{
      searchTextController.clear();
      setSearchListValue([]);
      setMatchFoundValue(true);
    }
    catch(exception){
      print(exception);
    }
  }

  void navigateToNotesEditorScreen(NotesBO notesBO){
    try{
      navigationStream.add(NavigatorPush(
        pageConfig: Pages.notesEditorScreenConfig, data: notesBO
      ));
    }
    catch(exception){
      print(exception);
    }
  }

  void navigateToPreviousScreen(){
    try{
      navigationStream.add(NavigatorPop(
        data: null
      ));
    }
    catch(exception){
      print(exception);
    }
  }
}