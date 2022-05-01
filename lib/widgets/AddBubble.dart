import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tringconnect/utils/images.dart';

class AddBubble extends StatefulWidget{
  const AddBubble({Key? key}) : super(key: key);

  @override
  State<AddBubble> createState() => AddBubbleState();
}

class AddBubbleState extends State<AddBubble>{
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return SizedBox(
        width: 56,
        height: 56,
        child: GestureDetector(
          child: SvgPicture.asset(Images.addChatRoom,width: 60,height: 60,fit: BoxFit.contain,alignment: Alignment.center,),
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      );
    } else {
      return SizedBox(
        width: 56,
        height: 56,
        child: GestureDetector(
          child: SvgPicture.asset(Images.addChatRoomGreen,width: 60,height: 60,fit: BoxFit.contain,),
          onTap: () {
            setState(() {
              isActive = !isActive;
            });
          },
        ),

      );
    }
  }
}