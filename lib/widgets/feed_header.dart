import 'package:flutter/material.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/custom_icon_button.dart';

import '../utils/colors.dart';

class FeedHeader extends StatefulWidget{
  final String imageUrl;
  final String userName;
  final String userRole;
  const FeedHeader({Key? key,required this.imageUrl, required this.userName, required this.userRole}) : super(key: key);

  @override
  State<FeedHeader> createState() => FeedHeaderState();
}

class FeedHeaderState extends State<FeedHeader>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      padding: const EdgeInsets.only(left: 20,right: 10,top: 20),
      child:Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 32,
            child: ClipOval(
              child: Image(
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                  image: NetworkImage(widget.imageUrl)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    widget.userRole,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins-Light'
                    ),
                  )
                ],
              ),
            )
          ),
          const StatefulButton(
            activeIcon: Images.moreGreen,
            inActiveIcon: Images.moreBlack,
            resetState: false,)

        ],
      )
    );
  }

}