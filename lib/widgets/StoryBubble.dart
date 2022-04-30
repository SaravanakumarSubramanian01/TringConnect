import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';

class StoryBubble extends StatefulWidget {
  final String imageUrl;
  final String label;

  const StoryBubble({Key? key, required this.imageUrl, required this.label})
      : super(key: key);

  @override
  State<StoryBubble> createState() => StoryBubbleState();
}
class StoryBubbleState extends State<StoryBubble>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.grey,
                    borderRadius: const BorderRadius.all( Radius.circular(60.0)),
                    onTap: () { },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: CustomColor.grey,
                            style: BorderStyle.solid,
                          )),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: CustomColor.white,
                        child: ClipOval(
                          child: Image(
                              fit: BoxFit.cover,
                              width: 52,
                              height: 52,
                              image: NetworkImage(widget.imageUrl)),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(
                            width: 1,
                            color: CustomColor.grey,
                            style: BorderStyle.solid,
                          ))))
            ],
          ),
          Text(
            widget.label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontFamily: 'Poppins-Regular', fontSize: 9),
          )
        ],
      ),
    );
  }
}
