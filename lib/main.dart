import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/utils/hive_.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'core/di/di.dart';
import 'screens/home_screen.dart';
import 'package:hive_flutter/adapters.dart';
void main() async{


  await Hive.initFlutter();

  Hive.registerAdapter(CarModelAdapter());
  await Hive.openBox<Car>("CarsData");
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen()
    );
  }
}


