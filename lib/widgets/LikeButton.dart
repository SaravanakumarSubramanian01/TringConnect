import 'package:flutter/material.dart';
import 'package:tringconnect/utils/images.dart';
import 'package:tringconnect/widgets/StatefulButton.dart';

class LikeButton extends StatefulWidget{
  final int likeCount;
  const LikeButton({Key? key,required this.likeCount,}) : super(key: key);

  @override
  State<LikeButton> createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton>{
  bool isSelected = false;
  late int likesCount = 0;
  @override
  void initState() {
    super.initState();
    likesCount = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          StatefulButton(
            activeIcon: Images.likeFilled,
            inActiveIcon: Images.likeOutline,
            callback:onLikeClicked,
            resetState: false,
          ),
          Text(
            likesCount.toString(),
            style: const TextStyle(fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',fontSize: 12),)
        ],
    );
  }
  void onLikeClicked(bool state){
    setState(() {
      isSelected = state;
    });
    if(likesCount > 0){
      if(!isSelected){
        likesCount += 1;
      }else{
        likesCount -= 1;
      }
    }
  }
}