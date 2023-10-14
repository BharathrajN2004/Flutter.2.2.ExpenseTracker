// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class historyAdapter extends TypeAdapter<history> {
  @override
  final int typeId = 1;

  @override
  history read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return history(
      name: fields[0] as String,
      amount: fields[1] as String,
      ipath: fields[2] as String,
      eori: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, history obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.ipath)
      ..writeByte(3)
      ..write(obj.eori);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is historyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
