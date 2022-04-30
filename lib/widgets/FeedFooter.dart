import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/CommentButton.dart';
import 'package:tringconnect/widgets/FooterComment.dart';
import 'package:tringconnect/widgets/LikeButton.dart';

class FeedFooter extends StatefulWidget {
  final String createdOn;
  final int likeCount;
  final int commentCount;

  const FeedFooter({Key? key, required this.createdOn, required this.likeCount,
    required this.commentCount}) : super(key: key);

  @override
  State<FeedFooter> createState() => FeedFooterState();
}

class FeedFooterState extends State<FeedFooter>{
  bool showCommentWidget = false;
  int commentsCount = 0;

  @override
  void initState() {
    super.initState();
    commentsCount = widget.commentCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomColor.white,
        child: Column(
            children: [
              Container(
                child:  Row(
                    children:[
                      Text(widget.createdOn,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300),
                      ),
                      Flexible(
                        flex: 1, child: Container(),),
                      LikeButton(likeCount:widget.likeCount),
                      CommentButton(
                        commentCount: commentsCount,
                        callback: onCommentClicked,
                        resetCommentState: !showCommentWidget,
                      ),
                    ]
                ),
                padding: const EdgeInsets.only(left: 24,right: 10),
              ),
              const Divider(height: 1,color: CustomColor.divider,),
              Builder(builder: (context) {
                if(showCommentWidget) {
                  return FooterComment(callback: onCommentSubmitted,);
                }
                else {
                  return Container();
                }
              })

            ]
        ),

    );
  }
  void onCommentClicked(bool state){
    setState(() {
      showCommentWidget = !state;
    });
  }
  void onCommentSubmitted(bool state){
    setState(() {
      if(commentsCount > 0){
        commentsCount += 1;
      }
      showCommentWidget = !state;
    });
  }
}