import 'package:flutter/material.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/StatefulButton.dart';

import '../utils/colors.dart';

class NotificationButton extends StatefulWidget{
  final bool hasUnReadNotification;
  const NotificationButton({Key? key,required this.hasUnReadNotification,}) : super(key: key);

  @override
  State<NotificationButton> createState() => NotificationButtonState();
}

class NotificationButtonState extends State<NotificationButton>{
  bool isSelected = false;
  late bool hasUnReadNotifications = false;
  @override
  void initState() {
    super.initState();
    hasUnReadNotifications = widget.hasUnReadNotification;
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Stack(
          children: [
            StatefulButton(
              activeIcon: Images.notificationGreen,
              inActiveIcon: Images.notificationBlack,
              callback:onNotificationClicked,
              resetState: false,
            ),
            Builder(builder: (context){
              if(hasUnReadNotifications){
                return Positioned(
                    left: 26,
                    top: 24,
                    child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              width: 1,
                              color: CustomColor.grey,
                              style: BorderStyle.solid,
                            )
                        )
                    )
                );
              }else{
                return Positioned(
                    left: 26,
                    top: 24,
                    child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color:Colors.transparent,
                              style: BorderStyle.solid,
                            )
                        )
                    )
                );;
              }
            })

          ],
        ),

      ],
    );
  }
  void onNotificationClicked(bool state){
    setState(() {
      isSelected = state;
      hasUnReadNotifications = false;
    });
  }
}