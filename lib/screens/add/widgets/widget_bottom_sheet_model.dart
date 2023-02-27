import 'package:avto_elon/core/models/brand_model.dart';
import 'package:avto_elon/core/models/model_model.dart';
import 'package:flutter/material.dart';

import '../../../providers/widgets_provider.dart';
import 'package:provider/provider.dart';
class WidgetBottomSheetModel extends StatefulWidget {
   const WidgetBottomSheetModel({Key? ke,this.callback,required this.brandId}) : super(key: ke);
  final Function(CarModel region)? callback;
  final  String brandId ;

  @override
  State<WidgetBottomSheetModel> createState() => _WidgetBottomSheetModelState();
}
class _WidgetBottomSheetModelState extends State<WidgetBottomSheetModel> {
  @override
  void initState() {
    var provider=Provider.of<ModelsProvider>(context,listen: false);
    provider.loadDataModels(widget.brandId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ModelsProvider>(context);
    return Container(
      height: 1000,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 15,),
      Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text("Avtomobil modeli",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      SizedBox(height:15 ,),
      Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(controller: TextEditingController(),
        cursorColor: Colors.black,
        enableInteractiveSelection:true,

        style: TextStyle(fontSize: 15.5),
        decoration: InputDecoration(
          hintText: "Avtomobil modeli",
          suffixIcon: Icon(Icons.search,color: Colors.black,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(
              color: Color(0xff626262),
              width: 2.0,
            ),
          ),
          hintStyle: TextStyle(fontSize: 15.5,color: Color(0xff878787)),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 19),
        ),
      ),
      ),
        Expanded(
          child: Builder(
            builder: (context) {
              if(provider.progress){
                return Center(child: CircularProgressIndicator());
              }
              else{
                return ListView.builder(
                  itemCount: provider.resultsModels.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff838383)))),
                      child: InkWell(
                        onTap: () {
                          widget.callback?.call(provider.resultsModels[index]);
                          },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 18, bottom: 18),
                          width: double.infinity,
                          child: Text(provider.resultsModels[index].name,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      ),
                    );

                  },);

              }
            }
          ),
        )
      ],),
    );
  }
}
