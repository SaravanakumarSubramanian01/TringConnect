import 'package:flutter/material.dart';
import 'package:tringconnect/utils/app_constants.dart';
import 'package:tringconnect/utils/colors.dart';

class CommentsList extends StatefulWidget{
  final List<String> comments;
  const CommentsList({Key? key, required this.comments}) : super(key: key);

  @override
  State<CommentsList> createState() => CommentsListState();
}

Widget renderComments(List<dynamic> comments) {
  List<Widget> result = [];
  for (var element in comments) {
    result.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: comment(Api.imageURL+"1",element)
      ),
    );
  }
  return Column(children: result,);
}
class CommentsListState extends State<CommentsList>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: renderComments(widget.comments),
    );
  }
}

Widget comment(image,comment){
  return Container(
    padding: const EdgeInsets.only(left: 10,right:10,top: 4),
    child:Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: CustomColor.containerGrey,
              radius: 18,
              child: ClipOval(
                child: Image(
                    fit: BoxFit.cover,
                    width: 24,
                    height: 24,
                    image: NetworkImage(image)),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Saravana",style: TextStyle(fontSize: 12,
                      fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: CustomColor.darkGrey),),
                  Text(comment,style: const TextStyle(fontSize: 10,
                      fontFamily: 'Poppins',fontWeight: FontWeight.w300,color: CustomColor.darkGrey),)
                ],
              ),
            ),
          ],
        ),

      ],
    ),

  );
}