import 'package:flutter/material.dart';

class WidgetDropDown extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? topText;
  final Function()? onTap;
  final bool? isHint;
  const WidgetDropDown({Key? key, this.controller, this.hintText,this.topText,this.onTap,this.isHint})
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
            readOnly: true,

            cursorColor: Colors.black,
            enableInteractiveSelection:true,
            onTap: onTap,
            style: TextStyle(fontSize: 15.5),
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: InkWell(child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,),onTap: onTap,),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: Color(0xff3d3d3d),
                  width: 2.0,
                ),
              ),
              hintStyle: TextStyle(fontSize: 15.5,color: isHint==true? Color(0xff878787):Colors.black),
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20.5),
            ),
          )]

    );
  }
}
