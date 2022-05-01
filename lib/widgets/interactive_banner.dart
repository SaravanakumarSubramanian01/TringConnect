import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';

import 'custom_button.dart';

class InteractiveBanner extends StatelessWidget{
  final Map mediaData;
  const InteractiveBanner({Key? key, required this.mediaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.paleGrey,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.bannerAWS,
              width: MediaQuery.of(context).size.width * .9,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mediaData['title'], textAlign: TextAlign.left, style: const TextStyle(fontSize: 14,
                        fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: CustomColor.darkGrey),),
                    Text(mediaData['subTitle'], textAlign: TextAlign.left, style: const TextStyle(fontSize: 9,
                        fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: CustomColor.disabledGrey))
                  ],
                ),
                const SizedBox(
                  width: 120,
                  child: CustomButton(activeLabel: 'Know More', inActiveLabel: 'Know More',outlined: true,),
                )



              ],
            ),
          )

        ],
      ),
    );
  }

}