import 'package:get_it/get_it.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationConfig.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Helpers/Mixins/PopupMixin.dart';
import 'package:notes_app/Pages/NotesEditorScreen/NotesEditorScreenModel.dart';
import 'package:notes_app/Services/PlatformServices/PlatformHiveLocalDbService/PlatformHiveLocalDbService.dart';

class NotesEditorScreenVM extends NotesEditorScreenModel{
  void onClickingBackBtn(String title, String description){
    try
    {
      if(titleController.text != title || descriptionController.text != description){
        addPopupEventToStream(event: ShowPopup(popUpName: 'discardChangesPopup'));
        return;
      }
      
      navigationStream.add(NavigatorPop(
        data: null
      ));
    }
    catch(exception){
      print(exception);
    }
  }

  void onClickingSaveBtn(String titleText, String descriptionText, int id) async{

    final PlatformHiveLocalDbService hiveDbService = GetIt.instance.get<PlatformHiveLocalDbService>();

    if(id == 0000){
      NotesBO notesData = NotesBO(id: 0, title: titleText, description: descriptionText);
      await hiveDbService.addNotes(notesBO:notesData);
    }
    else{
      NotesBO notesData = NotesBO(id: id, title: titleText, description: descriptionText);
      await hiveDbService.updateNotes(key: id, notesBO: notesData);
    }
    
    navigationStream.add(NavigatorPopAndRemoveUntil(
      data: null,
      pageConfig: Pages.homeScreenConfig,
      removeUntilpageConfig: Pages.homeScreenConfig
    ));
  }

  void onClickingDiscardBtn(){
    navigationStream.add(NavigatorPopAndRemoveUntil(
      data: null,
      pageConfig: Pages.homeScreenConfig,
      removeUntilpageConfig: Pages.homeScreenConfig
    ));
  }

  void showSaveChangesPopup(){
    try{
      addPopupEventToStream(event: ShowPopup(popUpName: 'saveChangesPopup'));
    }
    catch(exception){
      print(exception);
    }
  }
}