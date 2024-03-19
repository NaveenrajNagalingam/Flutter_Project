import 'package:flutter/material.dart';

class SaveChangesPopup extends StatefulWidget{

  final String titleText;
  final String description;
  final int id;
  final void Function(String titleText,String descriptionText,int id) onSaveClick;
  final void Function() onDiscardClick;

  const SaveChangesPopup({super.key,required this.titleText,required this.description,required this.id,required this.onSaveClick,required this.onDiscardClick});

  @override
  State<SaveChangesPopup> createState() => _SaveChangesPopupState();

}

class _SaveChangesPopupState extends State<SaveChangesPopup> with SingleTickerProviderStateMixin{

  late AnimationController _controller; 
  late Animation<double> _scaleAnimation; 
  
  @override 
  void initState() { 
    super.initState(); 
  
    _controller = AnimationController( 
      vsync: this, 
      duration: const Duration(milliseconds: 500), // Adjust the duration as needed 
    ); 
  
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller); 
  
    // Start the animation when  
    // the dialog is displayed 
    _controller.forward(); 
  } 
  
  @override 
  void dispose() { 
    _controller.dispose(); 
    super.dispose(); 
  } 

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
          backgroundColor: const Color(0xFF252525),
          title: const Column(
            children: [
              Image(
                image: AssetImage('lib/Helpers/Resources/Images/img_infoGray.png'),
                height: 28.8,
                width: 28.8,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Save Changes ?",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'NunitoRegular',
                    color: Color(0xFFCFCFCF)
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  // height: 39,
                  // width: 115,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFFFF0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.onDiscardClick();
                      // notesEditorScreenVM.onClickingDiscardBtn();
                    },
                    child: const Text(
                      "Discard",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'NunitoRegular',
                        color: Color(0xFFFFFFFF)
                      ),
                    )
                  ),
                ),
                SizedBox(
                  // height: 39,
                  // width: 112,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFF30BE71)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                        ),
                      ),
                    ),
                    onPressed: () async{
                      widget.onSaveClick(widget.titleText,widget.description,widget.id);
                      // notesEditorScreenVM.onClickingSaveBtn(notesEditorScreenVM.titleController.text, notesEditorScreenVM.descriptionController.text, widget.notesId);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'NunitoRegular',
                        color: Color(0xFFFFFFFF)
                      ),
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

}