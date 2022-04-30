
import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/FeedBody.dart';
import 'package:tringconnect/widgets/FeedFooter.dart';
import 'package:tringconnect/widgets/FeedHeader.dart';

class FeedItem extends StatelessWidget{
  const FeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: CustomColor.containerGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children:  const [
            FeedHeader(imageUrl: 'https://picsum.photos/200?random=1',userName: 'Saravanakumar',userRole: 'Senior Software Engineer',),
            FeedBody(postDescription: "Good marketing makes the company look smart. Great marketing makes customer feel smart.",),
            FeedFooter(createdOn: "3 weeks",likeCount: 100,commentCount: 100,),
          ],
        ),
      ),
    );
  }

}

