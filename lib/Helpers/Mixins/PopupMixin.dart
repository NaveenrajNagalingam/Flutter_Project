import 'dart:async';

abstract class PopupMixin{}

class ShowPopup extends PopupMixin{
  String popUpName;
  ShowPopup({required this.popUpName});
}

mixin PopupData{
  StreamController<PopupMixin?> popupController = StreamController<PopupMixin?>();

  void addPopupEventToStream({required PopupMixin event}) {
    popupController.add(event);
  }
  void closePopupStream() async{
    await popupController.close();
  }
}