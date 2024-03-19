import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationHelpers.dart';
import 'package:notes_app/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:notes_app/Pages/HomeScreen/HomeScreenVM.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key, required extraData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  // bool hasData = false;
  late Future<List<NotesBO>> responseList;
  HomeScreenVM homeScreenVM = HomeScreenVM();
  final List<NotesBO> notesList = [
    NotesBO(id: 1, title: 'Title 1', description: 'This is the description for the title 1 note in the notes app'),
    NotesBO(id: 1, title: 'Title 2', description: 'This is the description for the title 2 note in the notes app'),
    NotesBO(id: 1, title: 'Title 3', description: 'This is the description for the title 3 note in the notes app'),
  ];

  @override
  void initState(){
    super.initState();
    responseList = homeScreenVM.getAllNotesfromHive(true);
    homeScreenVM.navigationStream.stream.listen((event) {
      if(event is NavigatorPush){
        context.push(pageConfig: event.pageConfig,data: event.data);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: true,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 49.0),
          child: FloatingActionButton(
            backgroundColor: Color(0xFF252525),
            shape: CircleBorder(),
            onPressed: () {
              homeScreenVM.navigateToEditorScreen(NotesBO(id: 0000, title: '', description: ''));
            },
            child: const Image(
              image: AssetImage('lib/Helpers/Resources/Images/img_plus.png'),
              height: 28,
              width: 28,
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:  const Size.fromHeight(120.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 47.0, left: 25.0, right: 25.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 43,
                      fontFamily: 'NunitoSemibold'
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeScreenVM.navigateToSearchScreen();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xFF3B3B3B),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Image(
                        image: AssetImage('lib/Helpers/Resources/Images/img_search.png'),
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 21.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFF3B3B3B),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Image(
                      image: AssetImage('lib/Helpers/Resources/Images/img_info.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
        body: Observer(builder: (BuildContext context) { 
          return FutureBuilder(
            future: Future.value(homeScreenVM.notes),
            builder: (BuildContext context, AsyncSnapshot<List<NotesBO>> snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return 
                    Dismissible(
                      key: Key(snapshot.data![index].id.toString()),
                      onDismissed: (direction) {
                        homeScreenVM.removeNotesfromHive(snapshot.data![index].id);
                        // setState(() { 
                        //   snapshot.data!.removeAt(index); 
                        // }); 
                        ScaffoldMessenger.of(context).showSnackBar( 
                          SnackBar( 
                            content: Text('Item $index dismissed'), 
                          ), 
                        ); 
                      },
                      background: Container( 
                        color: Colors.red, 
                        alignment: Alignment.center, 
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon( 
                          Icons.delete, 
                          color: Colors.white, 
                          size: 36, 
                        ), 
                      ),
                      child: GestureDetector(
                        onTap: () {
                          homeScreenVM.navigateToEditorScreen(snapshot.data![index]);
                        },
                        onPanUpdate: (drag){ 

                        },
                        child: Container(
                          width: 365,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
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
                      ),
                    );
                  },
                );
              }
              return const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 37.0, right: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'lib/Helpers/Resources/Images/img_notesBanner.png'
                        ),
                        height: 286,
                        width: 350,
                      ),
                      Text(
                        'Create your first note !', 
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontFamily: 'NunitoLight'
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
         },
        )
      ),
    );
  }
}