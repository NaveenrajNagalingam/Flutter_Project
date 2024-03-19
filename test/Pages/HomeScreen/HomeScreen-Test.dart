import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/BOs/NotesBO/NotesBO.dart';
import 'package:notes_app/Helpers/ServiceHelper.dart';
import 'package:notes_app/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:notes_app/Services/PlatformServices/PlatformHiveLocalDbService/IPlatformHiveLocalDbService.dart';

import 'HomeScreen-Test.mocks.dart';

@GenerateMocks([IPlatformHiveLocalDbService])
void main() {
  group('HomeScreenVM test cases', () {
    
    late HomeScreenVM homeScreenVM;
    GetIt.instance.registerSingleton<IPlatformHiveLocalDbService>(MockIPlatformHiveLocalDbService());
    setUp(() {
      homeScreenVM = HomeScreenVM();
    });

    test('Get all notes from hive db', (){
      // Expected response
      var content = [
        NotesBO(id: 1, title: 'title', description: 'description'),
      ];
      var response = ServiceResult(statusCode: ServiceStatusCode.OK, content: content);

      // Set mock response for service method
      when(homeScreenVM.hiveDbService.getAllNotes()).thenAnswer((realInvocation) => Future.value(response));

      // Invoke VM method
      var actualResult = homeScreenVM.getAllNotesfromHive();

      // Assert check
      expect(actualResult, Future.value(response));
    });

  });
}