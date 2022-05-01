import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/custom_button.dart';
import 'package:tringconnect/widgets/custom_icon_button.dart';

class CoursesCarousel extends StatelessWidget{
  final List<dynamic> mediaData;
  const CoursesCarousel({Key? key, required this.mediaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      height: 246,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 4,right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mediaData.length,
          itemBuilder: (context,index){
            return course(mediaData[index],context);
          }),
    );
  }

}

Widget course(Map data, context){
  return Container(
    width: MediaQuery.of(context).size.width * .45,
    height: 220,
    decoration: BoxDecoration(
        color: CustomColor.bgTextInput,
        borderRadius: BorderRadius.circular(16)
    ),
    alignment: Alignment.center,
    margin: const EdgeInsets.only(left: 16),
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Image border
              child: SizedBox.fromSize(// I
                // mage radius
                child: Image.asset(data['courseImage'],
                    alignment: Alignment.center,
                    width: 160,height: 150,fit:BoxFit.cover),
              ),
            ),
            Positioned(
              top: 5,
              right: 7,
                child: Container(
                    decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(16)
                    ),
                  child:
                  const SizedBox(
                    width: 32,height: 32,
                    child:StatefulButton(
                      activeIcon: Images.likeFilled,
                      inActiveIcon: Images.likeOutline,
                      resetState: false,
                    ) ,
                  ),
                )
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(data['courseTitle'], textAlign:TextAlign.center,style: const TextStyle(
              fontWeight: FontWeight.w400,color: CustomColor.darkGrey,
              fontFamily: 'Poppins',fontSize: 12),),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(top: 4),
          width: 160,
            child: const CustomButton(activeLabel: 'Registered', inActiveLabel:'Register Now',outlined: false,)
        )




      ],
    ),
  );
}