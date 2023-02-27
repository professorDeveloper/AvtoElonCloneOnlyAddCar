import 'package:avto_elon/bloc/form_event.dart';
import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/providers/add_provider.dart';
import 'package:avto_elon/providers/widgets_provider.dart';
import 'package:avto_elon/screens/add/widgets/widget_bottom_sheet.dart';
import 'package:avto_elon/screens/add/widgets/widget_bottom_sheet_district.dart';
import 'package:avto_elon/screens/add/widgets/widget_bottom_sheet_model.dart';
import 'package:avto_elon/screens/add/widgets/widget_bottom_sheet_region.dart';
import 'package:avto_elon/screens/add/widgets/widget_drop_down.dart';
import 'package:avto_elon/screens/add/widgets/widget_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/form_bloc.dart';
import 'package:provider/provider.dart';
import '../../bloc/form_state.dart';
import '../../core/di/di.dart';
import '../home_screen.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  Widget get page {
    return BlocProvider(
      create: (context) => di.get<FormBloc>(),
      child: this,
    );
  }

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var autoMobileNum = "";
  var passportSe = "";
  var tePassportNum = "";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var provider = Provider.of<AddProvider>(context);

        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffefefef),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 10, bottom: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Color(0xffdfdfdf),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Add Auto",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            body: Builder(
              builder: (context) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: EdgeInsets.all(6.5),
                              decoration: BoxDecoration(
                                color: Color(0xffdfdfdf),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "BILISHIM MUHIM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xff8b8b8b),
                              size: 18,
                            ),
                            SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        width: double.infinity,
                        child: WidgetTextField(
                          controller: provider.autoMobileNumberController,
                          hintText: "90070AAA",
                          topText: "Avtomobil raqami",
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 10),
                              child: WidgetTextField(
                                controller: provider.passportSerController,
                                hintText: "aaf",
                                topText: "Passport Seriyasi",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 6, right: 20),
                              child: WidgetTextField(
                                controller: provider.passportNumberController,
                                hintText: "1643962S",
                                topText: "Texnik pasport raqam",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: WidgetDropDown(
                            isHint: provider.isHint,
                            topText: "Avtomobil markasi",
                            hintText: provider.setHint,
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ChangeNotifierProvider(
                                    create: (_) => ModelsProvider(),
                                    builder: (_, child) {
                                      return WidgetBottomSheet(
                                        callback: (brandModel) {
                                          provider.setBrend(brandModel.id);
                                          provider.changeAutoBrendHintStr(
                                              brandModel.name);
                                          provider.changeHint();
                                          provider.changeHintModelTrue();
                                          provider.changeHintAutoModelStr(
                                              "Auto Model");
                                          provider.notifyListeners();
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          )),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: WidgetDropDown(
                            topText: "Avtomobil modeli",
                            hintText: provider.setHintModel,
                            onTap: () {
                              if (provider.brendId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    new SnackBar(
                                        content: Text(
                                            'Automobil markeri tanlanmagan !')));
                              } else {
                                showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        topLeft: Radius.circular(25)),
                                  ),
                                  context: context,
                                  isDismissible: true,
                                  builder: (BuildContext context) {
                                    return ChangeNotifierProvider(
                                      create: (_) => ModelsProvider(),
                                      builder: (_, child) {
                                        return WidgetBottomSheetModel(
                                          callback: (brandModel) {
                                            provider.changeHintAutoModelStr(
                                                brandModel.name);
                                            provider.changeHintModel();
                                            Navigator.pop(context);
                                          },
                                          brandId: provider.brendId!,
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            isHint: provider.isHintModel,
                          )),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: WidgetDropDown(
                            isHint: provider.isRegionHint,
                            topText: "Viloyatingiz ",
                            hintText: provider.setHintRegion,
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ChangeNotifierProvider(
                                    create: (_) => ModelsProvider(),
                                    builder: (_, child) {
                                      return WidgetBottomSheetRegion(
                                        callback: (region) {
                                          provider
                                              .setRegion(region.id.toString());
                                          provider
                                              .changeRegionHint(region.title);
                                          provider.changeIsRegionHint();
                                          provider.changeHintDistrictTrue();

                                          provider
                                              .changeHintDistrictStr("Tuman");
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          )),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: WidgetDropDown(
                            topText: "Tumaningiz",
                            hintText: provider.setHintDistrict,
                            onTap: () {
                              if (provider.regionId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    new SnackBar(
                                        content:
                                        Text('Viloyat  tanlanmagan !')));
                              } else {
                                showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        topLeft: Radius.circular(25)),
                                  ),
                                  context: context,
                                  isDismissible: true,
                                  builder: (BuildContext context) {
                                    return ChangeNotifierProvider(
                                      create: (_) => ModelsProvider(),
                                      builder: (_, child) {
                                        return WidgetBottomSheetDistrict(
                                          callback: (brandModel) {
                                            provider.changeHintDistrictStr(
                                                brandModel.title);
                                            provider.changeIsDistrictHint();
                                            Navigator.pop(context);
                                          },
                                          regionId: provider.regionId!,
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            isHint: provider.isDistrictHint,
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 10),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xffe0e0e0),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      "Yopish",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 30),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      "Saqlash",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              onTap: () {
                                if (provider.chekIsEmpty()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      new SnackBar(
                                          content: Text('Maydonlar bo`sh !')));
                                } else {
                                  var car = Car(
                                      model: provider.setHintModel,
                                      brent: provider.setHint,
                                      passportSeNumber:
                                      provider.passportSerController.text,
                                      autoNumber: provider
                                          .autoMobileNumberController.text,
                                      district: provider.setHintDistrict,
                                      region: provider.setHintRegion,
                                      texPassportNumber: provider
                                          .passportNumberController.text);
                                  print('asdasdasd');
                                  print('asdasdasd');

                                  print(car.toString());
                                  di.get<FormBloc>().add(AddCarEvent(car: car));
                                  Navigator.pushReplacement(context,  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => const HomeScreen(),
                                  ),);                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        );

      }
    );
  }
}
