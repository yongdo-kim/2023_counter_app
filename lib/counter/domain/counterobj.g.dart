// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterobj.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterObjectHiveAdapter extends TypeAdapter<CounterObjectHive> {
  @override
  final int typeId = 3;

  @override
  CounterObjectHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterObjectHive(
      id: fields[0] as int,
      count: fields[1] as int,
      title: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CounterObjectHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterObjectHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
