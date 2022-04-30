import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/StatefulButton.dart';
import 'package:tringconnect/widgets/StoryBubble.dart';

class DashboardHeader extends StatelessWidget{
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 96,
        color: CustomColor.white,
        padding: const EdgeInsets.only(top: 8,left: 20),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              var imageURL = "https://picsum.photos/200?random" + index.toString();
              if(index == 0){
                return Column(
                  children: [
                    IconButton(
                        iconSize: 55,
                        onPressed: (){},
                        icon: SvgPicture.asset(Images.addChatRoom)
                    ),
                    const Text("")
                  ],
                );
              }
              return StoryBubble(imageUrl:imageURL, label: "test", );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            )
        )

    );
  }

}