import 'package:avto_elon/bloc/form_event.dart';
import 'package:avto_elon/core/db/local_repository.dart';
import 'package:avto_elon/core/models/Car.dart';
import 'package:avto_elon/providers/add_provider.dart';
import 'package:avto_elon/screens/add/add_screen.dart';
import 'package:avto_elon/screens/edit/widget_bottom_sheet_detail.dart';
import 'package:avto_elon/utils/car_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../bloc/form_bloc.dart';
import '../bloc/form_state.dart';
import '../providers/widgets_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ChangeNotifierProvider(
                      create: (_) => AddProvider(),
                      builder: (_, child) {
                        return AddScreen();
                      });
                },
              ));
            },
            child: Container(
                width: 133,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Qo`shish",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          body: Builder(builder: (context) {
            return Column(
              children: [
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: TextEditingController(),
                    cursorColor: Colors.black,
                    enableInteractiveSelection: true,
                    style: TextStyle(fontSize: 15.5),
                    decoration: InputDecoration(
                      hintText: "Avtomobillar...",
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide(
                          color: Color(0xff626262),
                          width: 2.0,
                        ),
                      ),
                      hintStyle:
                          TextStyle(fontSize: 15.5, color: Color(0xff878787)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 19),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: LocalDb().getAllCars().length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2 / 2.1),
                    itemBuilder: (context, index) {
                      var car = LocalDb().getAllCars()[index];
                      print('"assets/images/car$index.png"');

                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return WidgetBottomSheetDetail(car: car,index: index,);
                              },
                              isDismissible: true,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                              ));
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 115,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/car$index.png"),
                                        width: double.infinity,
                                        height: 100),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        car.model,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        car.brent,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 21,
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "per " +
                                            (index % 5 == 0
                                                ? "per week"
                                                : "per month" == "Daily"
                                                    ? "day"
                                                    : index % 3 == 0
                                                        ? "per week"
                                                        : "per month" ==
                                                                "Weekly"
                                                            ? "week"
                                                            : "month"),
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 14.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          })),
    );
  }
}
