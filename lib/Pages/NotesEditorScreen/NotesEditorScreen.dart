import 'package:flutter/material.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Helpers/Mixins/PopupMixin.dart';
import 'package:notes_app/Pages/NotesEditorScreen/NotesEditorScreenVM.dart';
import 'package:notes_app/Pages/Popups/DiscardChangesPopup/DiscardChangesPopup.dart';
import 'package:notes_app/Pages/Popups/SaveChangesPopup/SaveChangesPopup.dart';

class NotesEditorScreen extends StatefulWidget{
  String notesTitle = '';
  String notesDescription = '';
  int notesId = 0000;
  NotesEditorScreen({super.key, required extraData}){
    notesTitle = extraData.title;
    notesDescription = extraData.description;
    notesId = extraData.id;
  }

  @override
  State<NotesEditorScreen> createState() => _NotesEditorScreenState();

}

class _NotesEditorScreenState extends State<NotesEditorScreen> {
  NotesEditorScreenVM notesEditorScreenVM = NotesEditorScreenVM(); 

  @override
  void initState(){
    super.initState();
    notesEditorScreenVM.titleController.text = widget.notesTitle;
    notesEditorScreenVM.descriptionController.text = widget.notesDescription;

    notesEditorScreenVM.navigationStream.stream.listen((event) {
      if(event is NavigatorPop){
        context.pop(data: event.data);
      }
      else if(event is NavigatorPopAndRemoveUntil){
        context.pushNamedAndRemoveUntil(pageConfig: event.pageConfig, removeUntilpageConfig: event.removeUntilpageConfig, data: event.data);
      }
    });

    notesEditorScreenVM.popupController.stream.listen((event) { 
      if(event is ShowPopup){
        switch(event.popUpName){
          case 'saveChangesPopup':{
            saveChangesPopup();
          }break;
          case 'discardChangesPopup' :{
            discardChangesPopup();
          }break;
        }
      }
    });
  }

  void saveChangesPopup(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SaveChangesPopup(
          titleText: notesEditorScreenVM.titleController.text, 
          description:notesEditorScreenVM.descriptionController.text, 
          id: widget.notesId, 
          onSaveClick: notesEditorScreenVM.onClickingSaveBtn,
          onDiscardClick: notesEditorScreenVM.onClickingDiscardBtn,
        );
        // return AlertDialog(
        //   backgroundColor: const Color(0xFF252525),
        //   title: const Column(
        //     children: [
        //       Image(
        //         image: AssetImage('lib/Helpers/Resources/Images/img_infoGray.png'),
        //         height: 28.8,
        //         width: 28.8,
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(top: 25.0),
        //         child: Text(
        //           "Save Changes ?",
        //           style: TextStyle(
        //             fontSize: 23,
        //             fontFamily: 'NunitoRegular',
        //             color: Color(0xFFCFCFCF)
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         SizedBox(
        //           // height: 39,
        //           // width: 115,
        //           child: ElevatedButton(
        //             style: ButtonStyle(
        //               backgroundColor: const MaterialStatePropertyAll(Color(0xFFFF0000)),
        //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                 RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
        //                 ),
        //               ),
        //             ),
        //             onPressed: () {
        //               notesEditorScreenVM.onClickingDiscardBtn();
        //             },
        //             child: const Text(
        //               "Discard",
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 fontFamily: 'NunitoRegular',
        //                 color: Color(0xFFFFFFFF)
        //               ),
        //             )
        //           ),
        //         ),
        //         SizedBox(
        //           // height: 39,
        //           // width: 112,
        //           child: ElevatedButton(
        //             style: ButtonStyle(
        //               backgroundColor: const MaterialStatePropertyAll(Color(0xFF30BE71)),
        //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                 RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
        //                 ),
        //               ),
        //             ),
        //             onPressed: () async{
        //               notesEditorScreenVM.onClickingSaveBtn(notesEditorScreenVM.titleController.text, notesEditorScreenVM.descriptionController.text, widget.notesId);
        //             },
        //             child: const Text(
        //               "Save",
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 fontFamily: 'NunitoRegular',
        //                 color: Color(0xFFFFFFFF)
        //               ),
        //             )
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // );
      }
    );
  }

  void discardChangesPopup(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return DiscardChangesPopup(
          titleText: notesEditorScreenVM.titleController.text,
          description: notesEditorScreenVM.descriptionController.text, 
          id: widget.notesId, 
          onSaveClick: notesEditorScreenVM.onClickingSaveBtn,
          onDiscardClick: notesEditorScreenVM.onClickingDiscardBtn,
        );
        // return AlertDialog(
        //   backgroundColor: const Color(0xFF252525),
        //   title: const Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Image(
        //         image: AssetImage('lib/Helpers/Resources/Images/img_infoGray.png'),
        //         height: 28.8,
        //         width: 28.8,
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(top: 25.0),
        //         child: Text(
        //           "Are you sure you want discard your changes ?",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             fontSize: 23,
        //             fontFamily: 'NunitoRegular',
        //             color: Color(0xFFCFCFCF)
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Container(
        //           alignment: Alignment.center,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor: const MaterialStatePropertyAll(Color(0xFFFF0000)),
        //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                     RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
        //                     ),
        //                   ),
        //                 ),
        //                 onPressed: () {
        //                   notesEditorScreenVM.onClickingDiscardBtn();
        //                 },
        //                 child: const Text(
        //                   "Discard",
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     fontFamily: 'NunitoRegular',
        //                     color: Color(0xFFFFFFFF)
        //                   ),
        //                 )
        //               ),
        //             ],
        //           ),
        //         ),
        //         Container(
        //           alignment: Alignment.center,
        //           child: ElevatedButton(
        //             style: ButtonStyle(
        //               backgroundColor: const MaterialStatePropertyAll(Color(0xFF30BE71)),
        //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                 RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
        //                 ),
        //               ),
        //             ),
        //             onPressed: () {
        //               notesEditorScreenVM.onClickingSaveBtn(notesEditorScreenVM.titleController.text, notesEditorScreenVM.descriptionController.text, widget.notesId);
        //             },
        //             child: const Text(
        //               "Keep",
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 fontFamily: 'NunitoRegular',
        //                 color: Color(0xFFFFFFFF)
        //               ),
        //             )
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:  const Size.fromHeight(120.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 47.0, left: 25.0, right: 25.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('back icon clicked!------------');
                    notesEditorScreenVM.onClickingBackBtn(widget.notesTitle, widget.notesDescription);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFF3B3B3B),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('lib/Helpers/Resources/Images/img_back.png'),
                        height: 22.35,
                        width: 13.17,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFF3B3B3B),
                  ),
                  child: const Center(
                    child: Image(
                      image: AssetImage('lib/Helpers/Resources/Images/img_visibility.png'),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // saveChangesPopup();
                    notesEditorScreenVM.showSaveChangesPopup();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 21.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFF3B3B3B),
                    ),
                    child: const Center(
                      child: Image(
                        image: AssetImage('lib/Helpers/Resources/Images/img_save.png'),
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
          child: Column(
            children: [
              TextField(
                controller: notesEditorScreenVM.titleController,
                maxLines: null,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 34,
                  fontFamily: 'NunitoRegular'
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontFamily: 'NunitoRegular',
                    fontSize: 48,
                    color: Color(0xFF9A9A9A)
                  ),
                ),
              ),
              TextField(
                controller: notesEditorScreenVM.descriptionController,
                maxLines: null,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 23,
                  fontFamily: 'NunitoRegular'
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Something...',
                  hintStyle: TextStyle(
                    fontFamily: 'NunitoRegular',
                    fontSize: 23,
                    color: Color(0xFF9A9A9A)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}