// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_days_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDaysModelAdapter extends TypeAdapter<WeatherDaysModel> {
  @override
  final int typeId = 0;

  @override
  WeatherDaysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDaysModel(
      aveTemp: fields[0] as double,
      condition: fields[1] as String,
      minTemp: fields[2] as double,
      maxTemp: fields[3] as double,
      dayTime: fields[4] as String,
      icons: fields[5] as String,
      humidity: fields[6] as double,
      feelsLike: fields[7] as double,
      uvIndex: fields[8] as double,
      windDir: fields[9] as double,
      windSp: fields[10] as double,
      sunRise: fields[11] as String,
      sunSet: fields[12] as String,
      hourList: (fields[13] as List).cast<ListHour>(),
      daysList: (fields[14] as List).cast<ListDay>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDaysModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.aveTemp)
      ..writeByte(1)
      ..write(obj.condition)
      ..writeByte(2)
      ..write(obj.minTemp)
      ..writeByte(3)
      ..write(obj.maxTemp)
      ..writeByte(4)
      ..write(obj.dayTime)
      ..writeByte(5)
      ..write(obj.icons)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.feelsLike)
      ..writeByte(8)
      ..write(obj.uvIndex)
      ..writeByte(9)
      ..write(obj.windDir)
      ..writeByte(10)
      ..write(obj.windSp)
      ..writeByte(11)
      ..write(obj.sunRise)
      ..writeByte(12)
      ..write(obj.sunSet)
      ..writeByte(13)
      ..write(obj.hourList)
      ..writeByte(14)
      ..write(obj.daysList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDaysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListHourAdapter extends TypeAdapter<ListHour> {
  @override
  final int typeId = 1;

  @override
  ListHour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListHour(
      hourTime: fields[0] as String,
      icons: fields[1] as String,
      hourTemp: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ListHour obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hourTime)
      ..writeByte(1)
      ..write(obj.icons)
      ..writeByte(2)
      ..write(obj.hourTemp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListHourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ListDayAdapter extends TypeAdapter<ListDay> {
  @override
  final int typeId = 2;

  @override
  ListDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListDay(
      dateTime: fields[0] as String,
      icons: fields[1] as String,
      maxTemp: fields[2] as double,
      minTemp: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ListDay obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.icons)
      ..writeByte(2)
      ..write(obj.maxTemp)
      ..writeByte(3)
      ..write(obj.minTemp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
