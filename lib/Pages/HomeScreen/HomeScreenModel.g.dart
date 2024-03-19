// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$isUserHasNotesAtom =
      Atom(name: '_HomeScreenModelBase.isUserHasNotes', context: context);

  @override
  bool get isUserHasNotes {
    _$isUserHasNotesAtom.reportRead();
    return super.isUserHasNotes;
  }

  @override
  set isUserHasNotes(bool value) {
    _$isUserHasNotesAtom.reportWrite(value, super.isUserHasNotes, () {
      super.isUserHasNotes = value;
    });
  }

  late final _$notesAtom =
      Atom(name: '_HomeScreenModelBase.notes', context: context);

  @override
  List<NotesBO> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<NotesBO> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setBoolValue(bool hasNotes) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setBoolValue');
    try {
      return super.setBoolValue(hasNotes);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotesValue(List<NotesBO> notesResponse) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setNotesValue');
    try {
      return super.setNotesValue(notesResponse);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUserHasNotes: ${isUserHasNotes},
notes: ${notes}
    ''';
  }
}
