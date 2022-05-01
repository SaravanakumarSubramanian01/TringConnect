import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/comment_button.dart';
import 'package:tringconnect/widgets/comments_list.dart';
import 'package:tringconnect/widgets/footer_comment.dart';
import 'package:tringconnect/widgets/like_button.dart';

import 'comment_header.dart';

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
  List<String> comments = [];

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
                padding: const EdgeInsets.only(left: 24,right: 24),
              ),
              const Divider(height: 1,color: CustomColor.divider,),
              Builder(builder: (context) {
                if(showCommentWidget || comments.isNotEmpty) {
                  return const CommentHeader();
                }
                else {
                  return Container();
                }
              }),
              Builder(builder: (context){
                if(comments.isNotEmpty){
                  return CommentsList(comments: comments);
                }else{
                  return Container();
                }
              }),
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
  void onCommentSubmitted(bool state,String comment){
    setState(() {
      if(commentsCount > 0){
        commentsCount += 1;
      }
      if(comment.isNotEmpty){
        comments.add(comment);
      }
      showCommentWidget = !state;
    });
  }
}