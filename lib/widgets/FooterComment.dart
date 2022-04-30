import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/CommentHeader.dart';
import 'package:tringconnect/widgets/CommentView.dart';

class FooterComment extends StatelessWidget{
  final void Function(bool state) callback;
  const FooterComment({Key? key,required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      padding: const EdgeInsets.only(left: 12,right: 10),
      child: Column(
        children:  [
          const CommentHeader(),
          CommentView(callback: onCommentSubmit,)
        ],
      ),
    );
  }
  void onCommentSubmit(bool state){
    callback(state);
  }
}

