

import 'package:avto_elon/bloc/form_state.dart';

import '../core/db/local_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_event.dart';



class FormBloc extends Bloc<FormEvent, AppState> {
  LocalDb localDb;
  FormBloc(this.localDb)
      : super(UnitState()) {
    on<AddCarEvent>((event, emit) async {
      localDb.addCar(event.car);
      emit(AddLoadingState());

      await Future.delayed(Duration(milliseconds: 700));
      emit(AddSuccessState());

    });
    on<GetAllCars>((event, emit) async{
      emit(CarsLoadingState());
      await Future.delayed(Duration(seconds: 2));
      emit(CarsStete(cars: localDb.getAllCars(),error: ""));
    },);

  }
}
