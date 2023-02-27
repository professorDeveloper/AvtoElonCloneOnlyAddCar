import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? topText;

  const WidgetTextField({Key? key, this.controller, this.hintText,this.topText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 3),
            child: Text(topText.toString(), style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xffa8a8a8)
            ),),
          ),
          Text("*",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffca2254),fontSize: 13),)
        ],
      ),
    SizedBox(height: 5.5,),
    TextField(controller: controller,
      cursorColor: Colors.black,
    enableInteractiveSelection:true,
    style: TextStyle(fontSize: 15.5),
      decoration: InputDecoration(
    hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: Color(0xff3d3d3d),
            width: 2.0,
          ),
        ),
    hintStyle: TextStyle(fontSize: 15.5,color: Color(0xff878787)),
    border:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(13),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 19),
    ),
    )]

    );
  }
}
