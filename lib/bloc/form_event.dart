import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import '../core/models/Car.dart';
import '../core/models/distict_model.dart';
import '../core/models/region_model.dart';
@immutable
abstract class FormEvent extends Equatable {}

class FormChangedEvent extends FormEvent {
  final RegionModel? region;
  final DistrictModel? district;

  FormChangedEvent({this.region, this.district});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class AddCarEvent extends FormEvent{
  Car car;

  AddCarEvent({required this.car});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class GetAllCars extends FormEvent{


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}