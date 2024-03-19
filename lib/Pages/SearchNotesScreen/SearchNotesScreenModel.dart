import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';

part 'SearchNotesScreenModel.g.dart';
class SearchNotesScreenModel extends _SearchNotesScreenModelBase with _$SearchNotesScreenModel{

}
abstract class _SearchNotesScreenModelBase with Store, NavigationMixin{

  TextEditingController searchTextController = TextEditingController();

  @observable
  List<NotesBO> searchList = [];

  @observable
  bool isMatchFound = true;

  @action
  void setSearchListValue(List<NotesBO> searchResponse){
    searchList = searchResponse;
  }
  
  @action
  void setMatchFoundValue(bool isFound){
    isMatchFound = isFound;
  }
}