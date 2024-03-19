import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/ServiceHelper.dart';

abstract class IPlatformHiveLocalDbService{
  Future<ServiceResult<bool>> addNotes({required NotesBO notesBO});
  Future<ServiceResult<bool>> deleteNotes({required int key});
  Future<ServiceResult<bool>> updateNotes({required int key, required NotesBO notesBO});
  Future<ServiceResult<List<NotesBO>>> getAllNotes();
}