// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateUserData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseInfoAdapter extends TypeAdapter<PurchaseInfo> {
  @override
  final int typeId = 12;

  @override
  PurchaseInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseInfo(
      type: fields[0] as String,
      bet: fields[1] as String,
      earned: fields[2] as String,
      bonus: fields[3] as String,
      multyplicator: fields[4] as String,
      win: fields[5] as String,
      currentDay: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.bet)
      ..writeByte(2)
      ..write(obj.earned)
      ..writeByte(3)
      ..write(obj.bonus)
      ..writeByte(4)
      ..write(obj.multyplicator)
      ..writeByte(5)
      ..write(obj.win)
      ..writeByte(6)
      ..write(obj.currentDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 13;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      myAccount: fields[0] as int,
      betAmmount: fields[1] as int,
      hardLevel: fields[2] as int,
      currentColorIndex: fields[3] as int,
      currentShipIndex: fields[4] as int,
      currentPathIndex: fields[5] as int,
      allAvaluableColorsIndexes: (fields[6] as List).cast<int>(),
      allAvaluableShipsIndexes: (fields[7] as List).cast<int>(),
      allAvaluablePathsIndexes: (fields[8] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.myAccount)
      ..writeByte(1)
      ..write(obj.betAmmount)
      ..writeByte(2)
      ..write(obj.hardLevel)
      ..writeByte(3)
      ..write(obj.currentColorIndex)
      ..writeByte(4)
      ..write(obj.currentShipIndex)
      ..writeByte(5)
      ..write(obj.currentPathIndex)
      ..writeByte(6)
      ..write(obj.allAvaluableColorsIndexes)
      ..writeByte(7)
      ..write(obj.allAvaluableShipsIndexes)
      ..writeByte(8)
      ..write(obj.allAvaluablePathsIndexes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
