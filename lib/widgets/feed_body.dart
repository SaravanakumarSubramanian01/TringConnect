import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/dynamic_media_renderer.dart';
import 'package:tringconnect/widgets/interactive_banner.dart';

import 'text_toggle.dart';

class FeedBody extends StatefulWidget{
  final String postDescription;
  final List<dynamic> tags;
  final List<dynamic> mediaData;
  final String feedType;
  const FeedBody({Key? key, required this.postDescription,
    required this.tags, required this.mediaData, required this.feedType,}) : super(key: key);

  @override
  State<FeedBody> createState() => FeedBodyState();
}

class FeedBodyState extends State<FeedBody>{

  List<Widget> getTags( List<dynamic> tags){
    List<Widget> result = [];
    for (var element in tags) {
      result.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(element['tagLabel'],
            style: const TextStyle(
                color: CustomColor.tagsGrey,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300),)),
        );
    }
    return result;

  }
  @override
  Widget build(BuildContext context) {
   return Container(
       width: MediaQuery.of(context).size.width,
       color: Colors.white,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             color: CustomColor.white,
             padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
             child: Text(
               widget.postDescription,
               textAlign: TextAlign.start,
               softWrap: true,
               maxLines: 10,
               style: const TextStyle(
                 fontWeight: FontWeight.normal,
                 fontFamily: 'Poppins',
                 fontSize: 16
               ),
             ),
           ),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width * .75,
                 child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: getTags(widget.tags),
                   ),

                 ),

               ),
               const TextToggle(activeText: 'Read Less',inActiveText: 'Read More',)
             ],
           ),
           Builder(builder: (context) {
             if(widget.mediaData.isNotEmpty && widget.feedType == 'user_feed') {
               return DynamicMediaRenderer(mediaData: widget.mediaData);
             }else if(widget.mediaData.isNotEmpty && widget.feedType == 'admin_feed'){
               return  InteractiveBanner(mediaData: widget.mediaData[0],);
             }else {
               return Container();
             }
           })







         ],
     )
   );
  }

}