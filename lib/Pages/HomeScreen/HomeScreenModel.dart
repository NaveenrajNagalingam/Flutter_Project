// ignore_for_file: unnecessary_this

import 'package:mobx/mobx.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';

part 'HomeScreenModel.g.dart';
class HomeScreenModel extends _HomeScreenModelBase with _$HomeScreenModel{

}

abstract class _HomeScreenModelBase with Store, NavigationMixin{
  @observable
  bool isUserHasNotes = false;

  @observable
  List<NotesBO> notes = [];

  @action
  void setBoolValue(bool hasNotes){
    this.isUserHasNotes = hasNotes;
  }

  @action
  void setNotesValue(List<NotesBO> notesResponse){
    this.notes = notesResponse;
  }
}