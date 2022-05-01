import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tringconnect/utils/app-constants.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/utils/images.dart';

class CommentView extends StatefulWidget{
  final void Function(bool state,String comment)? callback;
  const CommentView({Key? key, this.callback}) : super(key: key);

  @override
  State<CommentView> createState() => CommentViewState();
}

class CommentViewState extends State<CommentView>{
  TextEditingController ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: Image(
                  fit: BoxFit.cover,
                  width: 32,
                  height: 32,
                  image: NetworkImage(Api.imageURL+'1')),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * .78,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if(!hasFocus){
                    widget.callback!(true,ctrl.text);
                    ctrl.text = "";

                  }
                },
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.only(left: 8,right: 10),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 40,
                      ),
                      suffixIcon: IconButton(
                        icon:SvgPicture.asset(Images.iconSendGrey,width: 24,height: 24,fit: BoxFit.contain,),
                        onPressed: () {
                          widget.callback!(true, ctrl.text);
                          ctrl.text = "";
                          },
                      ),
                      fillColor: CustomColor.bgTextInput,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Add a comment...',
                    ),
                    controller: ctrl,

                  ),
              )


          )

        ],
      ),
    );
  }

}