// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListModelAdapter extends TypeAdapter<ListModel> {
  @override
  final int typeId = 1;

  @override
  ListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListModel(
      date: fields[0] as String,
      subject: fields[1] as String,
      matter: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.matter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
