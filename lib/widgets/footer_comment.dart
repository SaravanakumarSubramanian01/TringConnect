import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/comment_view.dart';

class FooterComment extends StatelessWidget{
  final void Function(bool state,String comment) callback;
  const FooterComment({Key? key,required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      padding: const EdgeInsets.only(left: 12,right: 10),
      child: CommentView(callback: onCommentSubmit,)
    );
  }
  void onCommentSubmit(bool state,String comment){
    callback(state,comment);
  }
}

