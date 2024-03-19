// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchNotesScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchNotesScreenModel on _SearchNotesScreenModelBase, Store {
  late final _$searchListAtom =
      Atom(name: '_SearchNotesScreenModelBase.searchList', context: context);

  @override
  List<NotesBO> get searchList {
    _$searchListAtom.reportRead();
    return super.searchList;
  }

  @override
  set searchList(List<NotesBO> value) {
    _$searchListAtom.reportWrite(value, super.searchList, () {
      super.searchList = value;
    });
  }

  late final _$isMatchFoundAtom =
      Atom(name: '_SearchNotesScreenModelBase.isMatchFound', context: context);

  @override
  bool get isMatchFound {
    _$isMatchFoundAtom.reportRead();
    return super.isMatchFound;
  }

  @override
  set isMatchFound(bool value) {
    _$isMatchFoundAtom.reportWrite(value, super.isMatchFound, () {
      super.isMatchFound = value;
    });
  }

  late final _$_SearchNotesScreenModelBaseActionController =
      ActionController(name: '_SearchNotesScreenModelBase', context: context);

  @override
  void setSearchListValue(List<NotesBO> searchResponse) {
    final _$actionInfo = _$_SearchNotesScreenModelBaseActionController
        .startAction(name: '_SearchNotesScreenModelBase.setSearchListValue');
    try {
      return super.setSearchListValue(searchResponse);
    } finally {
      _$_SearchNotesScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMatchFoundValue(bool isFound) {
    final _$actionInfo = _$_SearchNotesScreenModelBaseActionController
        .startAction(name: '_SearchNotesScreenModelBase.setMatchFoundValue');
    try {
      return super.setMatchFoundValue(isFound);
    } finally {
      _$_SearchNotesScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchList: ${searchList},
isMatchFound: ${isMatchFound}
    ''';
  }
}
