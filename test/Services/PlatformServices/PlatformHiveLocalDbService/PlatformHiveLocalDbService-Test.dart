
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  test('description', (){
    expect(true, true);
  });
}