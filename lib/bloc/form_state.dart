
import 'package:avto_elon/core/models/Car.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
@immutable
abstract class  AppState extends Equatable {}

class UnitState extends AppState{

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
class AddLoadingState extends AppState{
  @override
  List<Object?> get props => throw UnimplementedError();


}
class AddSuccessState extends AppState{
  @override
  List<Object?> get props => throw UnimplementedError();


}
class CarsStete extends AppState {
  final List<Car> cars;
  final String error;

  CarsStete({required this.cars, required this.error});

  factory CarsStete.initial() => CarsStete(
    cars: [],
    error: '',
  );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CarsLoadingState extends AppState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


