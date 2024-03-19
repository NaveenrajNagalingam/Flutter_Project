import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Pages/NotesEditorScreen/NotesEditorScreen.dart';
import 'package:notes_app/Pages/SearchNotesScreen/SearchNotesScreenVM.dart';

class SearchNotesScreen extends StatefulWidget{
  const SearchNotesScreen({super.key, required extraData});

  @override
  State<SearchNotesScreen> createState() => _SearchNotesScreenState();

}

class _SearchNotesScreenState extends State<SearchNotesScreen> {

  bool isFoundNotes = false;
  SearchNotesScreenVM searchNotesScreenVM = SearchNotesScreenVM();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140.0), 
          child: Padding(
            padding: const EdgeInsets.only(left: 27.0, right: 27.0, top: 88.0),
            child: TextField(
              controller: searchNotesScreenVM.searchTextController,
              onChanged: (value) {
                searchNotesScreenVM.searchNotes(value);
              },
              cursorColor: const Color(0xFFCCCCCC),
              maxLines: null,
              style: const TextStyle(
                color: Color(0xFFCCCCCC),
                fontSize: 20,
                fontFamily: 'NunitoLight'
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF3B3B3B),
                // focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 38.0, top: 12.0, bottom: 12.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                hintText: 'Search by the keyword...',
                hintStyle: const TextStyle(
                  fontFamily: 'NunitoLight',
                  fontSize: 20,
                  color: Color(0xFFCCCCCC)
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    onPressed: (){
                      searchNotesScreenVM.clearSearchText();
                    }, 
                    icon: const Icon(
                      Icons.close,
                      weight: 24.0,
                      color: Color(0xFFCCCCCC),
                    )
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: IconButton(
                    onPressed: (){
                      // searchNotesScreenVM.navigateToPreviousScreen();
                      Navigator.pop(context);
                    }, 
                    icon: const Icon(
                      Icons.arrow_back,
                      weight: 24.0,
                      color: Color(0xFFCCCCCC),
                    )
                  ),
                ),
              ),
            ),
          )
        ),
        body: Observer(
          builder: (BuildContext context) {
            return FutureBuilder(
              future: Future.value(searchNotesScreenVM.searchList),
              builder: (BuildContext context, AsyncSnapshot<List<NotesBO>> snapshot){
                if(snapshot.hasData && searchNotesScreenVM.isMatchFound){
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          print('search list tapped -------------------------------------------');
                          // searchNotesScreenVM.navigateToNotesEditorScreen(snapshot.data![index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotesEditorScreen(extraData: snapshot.data![index],)),
                          );
                        },
                        child: Container(
                          width: 365,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.pink[300],
                          ),
                          padding: const EdgeInsets.all(25.0),
                          margin: const EdgeInsets.all(25.0),
                          child: Text(
                            snapshot.data![index].title,
                            style: const TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 25,
                              fontFamily: 'NunitoRegular'
                            ),
                          ),
                        ),
                      );
                    }
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(
                          'lib/Helpers/Resources/Images/img_searchBanner.png'
                        ),
                        height: ScreenUtil().setHeight(240),
                        width: ScreenUtil().setWidth(370),
                      ),
                      const Text(
                        'File not found. Try searching again.',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontFamily: 'NunitoLight'
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          },
        ),
      ),
    );
  }
}