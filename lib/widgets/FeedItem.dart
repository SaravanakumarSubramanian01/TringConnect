
import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/FeedBody.dart';
import 'package:tringconnect/widgets/FeedFooter.dart';
import 'package:tringconnect/widgets/FeedHeader.dart';

import '../utils/app-constants.dart';

class FeedItem extends StatelessWidget{
  final Map data;
  const FeedItem({Key? key, required this.data,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: CustomColor.containerGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children:  [
            FeedHeader(imageUrl:  data["profileImage"],userName: data["name"],userRole: data["role"],),
            GestureDetector(
              onTap: (){
                if(data['media'].length > 0 && data['type'] == 'user_feed'){
                  Navigator.of(context).pushNamed( RoutePaths.MEDIA_VIEWER, arguments: data['media']);
                }

              },
              child: FeedBody(
                postDescription: data["post"],
                tags: data["tags"],
                mediaData: data['media'],
                feedType:data["type"],
              ),
            ),
            FeedFooter(createdOn: data["commentedOn"],likeCount: data["likes"],commentCount: data["comments"],),
          ],
        ),
      ),
    );
  }

}

