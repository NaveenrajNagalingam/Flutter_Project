import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Helpers/Mixins/PopupMixin.dart';

part 'NotesEditorScreenModel.g.dart';
class NotesEditorScreenModel extends _NotesEditorScreenModelBase with _$NotesEditorScreenModel{

}

abstract class _NotesEditorScreenModelBase with Store, NavigationMixin, PopupData{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
}