import 'package:avto_elon/core/api/form_api.dart';
import 'package:avto_elon/core/models/model_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';

import '../core/models/brand_model.dart';

class AddProvider extends ChangeNotifier{
  bool isHint =true;
  bool isHintModel =true;
  bool isRegionHint =true;
  bool isDistrictHint =true;
  String setHint="Auto Marka";
  String setHintRegion="Viloyat";
  bool progress=false;
  String setHintModel="Auto Model";
  String setHintDistrict="Tuman";
  String?  brendId;
  String?  regionId;
  TextEditingController passportNumberController=TextEditingController();
  TextEditingController autoMobileNumberController=TextEditingController();
  TextEditingController passportSerController=TextEditingController();
  void setBrend(String id){
    brendId=id;
    notifyListeners();
  }
  bool chekIsEmpty(){
    return passportNumberController.text.isEmpty||autoMobileNumberController.text.isEmpty||passportSerController.text.isEmpty;
  }

  void changeProgress()async{
    progress=true;
    notifyListeners();
  }
  void setRegion(String id){
    regionId=id;
    notifyListeners();
  }
  void changeRegionHint(String string){
    setHintRegion=string;
    notifyListeners();
  }
  void changeAutoBrendHintStr(String string){
    setHint=string;
    notifyListeners();
  }
  void changeHintAutoModelStr(String string){
    setHintModel=string;
    notifyListeners();
  }
  void changeHintDistrictStr(String string){
    setHintDistrict=string;
    notifyListeners();
  }
  void changeHint(){
    isHint=false;
    notifyListeners();
  }
  void changeIsDistrictHint(){
    isDistrictHint=false;
    notifyListeners();
}
  void changeIsRegionHint(){
    isRegionHint=false;
    notifyListeners();
  }
  void changeHintModelTrue(){
    isHintModel=true;
    notifyListeners();
  }
  void changeHintDistrictTrue(){
    isDistrictHint=true;
    notifyListeners();
  }
  void changeHintModel(){
    isHintModel=false;
    notifyListeners();
  }


}