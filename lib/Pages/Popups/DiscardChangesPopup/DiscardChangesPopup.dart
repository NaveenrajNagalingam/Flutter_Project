import 'package:flutter/material.dart';

class DiscardChangesPopup extends StatefulWidget{

  final String titleText;
  final String description;
  final int id;
  final void Function(String titleText,String descriptionText,int id) onSaveClick;
  final void Function() onDiscardClick;

  const DiscardChangesPopup({super.key, required this.titleText, required this.description, required this.id, required this.onSaveClick, required this.onDiscardClick});

  @override
  State<DiscardChangesPopup> createState() => _DiscardChangesPopupState();

}

class _DiscardChangesPopupState extends State<DiscardChangesPopup> with SingleTickerProviderStateMixin{

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('lib/Helpers/Resources/Images/img_infoGray.png'),
                height: 28.8,
                width: 28.8,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Are you sure you want discard your changes ?",
                  textAlign: TextAlign.center,
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
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
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
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xFF30BE71)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // Set your desired border radius
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.onSaveClick(widget.titleText,widget.description,widget.id);
                      // notesEditorScreenVM.onClickingSaveBtn(notesEditorScreenVM.titleController.text, notesEditorScreenVM.descriptionController.text, widget.notesId);
                    },
                    child: const Text(
                      "Keep",
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