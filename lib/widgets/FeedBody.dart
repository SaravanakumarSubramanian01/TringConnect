import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';

class FeedBody extends StatefulWidget{
  final String postDescription;
  const FeedBody({Key? key, required this.postDescription}) : super(key: key);

  @override
  State<FeedBody> createState() => FeedBodyState();
}

class FeedBodyState extends State<FeedBody>{
  @override
  Widget build(BuildContext context) {
   return Container(
       color: Colors.white,
       child: Column(
         children: [
           Container(
             color: CustomColor.white,
             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
             child: Text(
               widget.postDescription,
               softWrap: true,
               maxLines: 10,
               style: const TextStyle(
                 fontWeight: FontWeight.normal,
                 fontFamily: 'Poppins',
                 fontSize: 16
               ),
             ),
           ),
           ListView.builder(
             itemCount: 5,
             itemBuilder: (context,index){
               return const Text("@");
             })


         ],
     )
   );
  }

}