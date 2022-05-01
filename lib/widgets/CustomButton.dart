import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatefulWidget{
  final bool outlined;
  final String label;
  const CustomButton({Key? key, required this.outlined, required this.label}) : super(key: key);

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton>{
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      if(!isActive){
        return Container(
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.outlined?CustomColor.primaryGreen:Colors.transparent,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4)
          ),
          child: TextButton(
              onPressed: (){
                setState(() {
                  isActive =!isActive;
                });
              },
              style: ButtonStyle(
                backgroundColor: widget.outlined?MaterialStateProperty.all<Color>(Colors.transparent):
                MaterialStateProperty.all<Color>(CustomColor.grey),
              ),

              child:  Text(widget.label,
                textAlign:TextAlign.center,style: const TextStyle(
                    fontWeight: FontWeight.w400,color: CustomColor.darkGrey,
                    fontFamily: 'Poppins',fontSize: 12),)
          ),
        );
      }else{
        return SizedBox(
          height: 44,
          child: TextButton(
              onPressed: (){
                setState(() {
                  isActive =!isActive;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(CustomColor.primaryGreen),
              ),

              child: Text(widget.label,
                textAlign:TextAlign.center,style: const TextStyle(
                    fontWeight: FontWeight.w400,color: CustomColor.white,
                    fontFamily: 'Poppins',fontSize: 12),)
          ),
        );
      }
    },);
  }

}