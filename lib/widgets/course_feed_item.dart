import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/courses_carousel.dart';
import 'package:tringconnect/widgets/feed_footer.dart';

import '../utils/images.dart';
import 'custom_icon_button.dart';

class CourseFeedItem extends StatelessWidget{
  final Map feedData;
  const CourseFeedItem({Key? key, required this.feedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(feedData.toString());
    return Container(
      color: CustomColor.white,
      //padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text(feedData['name'],style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: CustomColor.darkGrey,
                    fontWeight: FontWeight.w500),),
                const StatefulButton(
                  activeIcon: Images.moreGreen,
                  inActiveIcon: Images.moreBlack,
                  resetState: false,
                )
              ],
            ),
          ),
          CoursesCarousel(mediaData: feedData['courses']),
          FeedFooter(createdOn: feedData['date'], likeCount: feedData['likes'], commentCount: feedData['comments'])
        ],
      ),
    );
  }

}