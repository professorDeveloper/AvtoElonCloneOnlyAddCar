// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/core/models/Car.dart';
import 'package:hive/hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarModelAdapter extends TypeAdapter<Car> {
  @override
  final int typeId = 0;

  @override
  Car read(BinaryReader reader) {
    return Car(
        model: reader.read(),
        brent: reader.read(),
        region: reader.read(),
        district: reader.read(),
        autoNumber: reader.read(),
        texPassportNumber: reader.read(),
        passportSeNumber: reader.read());
  }

  @override
  void write(BinaryWriter writer, Car obj) {
    writer.write(obj.model);
    writer.write(obj.brent);
    writer.write(obj.region);
    writer.write(obj.district);
    writer.write(obj.autoNumber);
    writer.write(obj.texPassportNumber);
    writer.write(obj.passportSeNumber);
  }
}
