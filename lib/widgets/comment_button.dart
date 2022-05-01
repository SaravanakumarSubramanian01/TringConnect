
import 'package:flutter/material.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/custom_icon_button.dart';

class CommentButton extends StatefulWidget{
  final int commentCount;
  final bool resetCommentState;
  final void Function(bool state)? callback;
  const CommentButton({Key? key,required this.commentCount, this.callback,
    required this.resetCommentState}) : super(key: key);

  @override
  State<CommentButton> createState() => CommentButtonState();
}

class CommentButtonState extends State<CommentButton>{
  bool isSelected = false;
  bool resetState = false;
  late int commentsCount = 0;
  @override
  void initState() {
    super.initState();
    commentsCount = widget.commentCount;
  }
  @override
  void didUpdateWidget(covariant CommentButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    commentsCount = widget.commentCount;
    resetState = widget.resetCommentState;
    isSelected = false;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          StatefulButton(
            activeIcon: Images.commentBlack,
            inActiveIcon: Images.commentGrey,
            callback:onCommentClicked,
            resetState: resetState,
          ),
          Text(
            commentsCount.toString(),
            style: const TextStyle(fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',fontSize: 12),)
        ],
    );
  }

  void onCommentClicked(bool state){
    setState(() {
      isSelected = state;
    });
    widget.callback!(state);
  }

}