// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotesBO.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesBOAdapter extends TypeAdapter<NotesBO> {
  @override
  final int typeId = 0;

  @override
  NotesBO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesBO(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesBO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesBOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
