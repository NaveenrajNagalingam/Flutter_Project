import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppConstants.dart';
import 'package:notes_app/Helpers/ServiceHelper.dart';
import 'package:notes_app/Services/PlatformServices/PlatformHiveLocalDbService/IPlatformHiveLocalDbService.dart';

class PlatformHiveLocalDbService implements IPlatformHiveLocalDbService{
  @override
  Future<ServiceResult<bool>> addNotes({required NotesBO notesBO}) async{
    await AppConstants.hiveNotesBox.add(notesBO);
    return ServiceResult(statusCode: resolveStatusCode(200), content: true);
  }

  @override
  Future<ServiceResult<bool>> deleteNotes({required int key}) async{
    await AppConstants.hiveNotesBox.delete(key);
    return ServiceResult(statusCode: resolveStatusCode(200), content: true);
  }

  @override
  Future<ServiceResult<List<NotesBO>>> getAllNotes() async{
    // Retrieve data from hive local db
    final List<dynamic> response = await AppConstants.hiveNotesBox.keys.map((key) { 
      NotesBO value = AppConstants.hiveNotesBox.get(key); 
      return {"id": key, "title": value.title, "description": value.description}; 
    }).toList(); 

    // Covert the dynamic list into the List of NotesBO
    List<NotesBO> notesList = response.map((dynamic json) {
      return NotesBO.fromJson(json);
    }).toList();

    // Return response of type service result
    return ServiceResult(statusCode: resolveStatusCode(200), content: notesList);
  }

  @override
  Future<ServiceResult<bool>> updateNotes({required int key, required NotesBO notesBO}) async{
    await AppConstants.hiveNotesBox.put(key, notesBO);
    return ServiceResult(statusCode: resolveStatusCode(200), content: true);
  }

}