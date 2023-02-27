import 'package:avto_elon/core/di/di.dart';

class Car{
  String model;
  String  brent;
  String region;
  String district;
  String autoNumber;
  String texPassportNumber;
  String passportSeNumber;

  Car({required this.model, required this.brent, required this.region, required this.district, required this.autoNumber,
    required this.texPassportNumber, required this.passportSeNumber});
  @override
  String toString() {
    // TODO: implement toString
    return "$model $brent $region $district $autoNumber $texPassportNumber $passportSeNumber";
  }
}