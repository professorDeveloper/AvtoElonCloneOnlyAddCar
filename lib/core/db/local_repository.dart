import 'package:avto_elon/core/models/Car.dart';
import 'package:hive/hive.dart';
class LocalDb{
   final String boxName ="CarsData";

   List<Car> getAllCars() {

     var notesBox = Hive.box<Car>(boxName);

    return  notesBox.values.toList();
  }
  Future<int> addCar(Car contactModel)async{
    var notesBox = Hive.box<Car>(boxName);
    return  await notesBox.add(contactModel);
  }
}