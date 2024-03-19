import 'package:hive/hive.dart';
part 'NotesBO.g.dart';

@HiveType(typeId: 0)
class NotesBO extends HiveObject{

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String title;
  
  @HiveField(2)
  late String description;

  NotesBO({required this.id, required this.title, required this.description});

  factory NotesBO.fromJson(Map<String, dynamic> json) {
    return NotesBO(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}