
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tringconnect/widgets/DashboardHeader.dart';
import 'package:tringconnect/widgets/FeedItem.dart';

import '../widgets/CourseFeedItem.dart';


class Dashboard extends StatefulWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}
Future<List> getData(context) async {
  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/data.json');
  final body =  await json.decode(data);
  return body.toList();
}
class DashboardState extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const DashboardHeader(),
        FutureBuilder(
          future: getData(context),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return const Text('No feeds found.');
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading ...');
            }
            return  Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      if(snapshot.data[index]['type'] != 'courses_feed'){
                        return FeedItem(data: snapshot.data[index],);
                      }else{
                        return CourseFeedItem(feedData: snapshot.data[index],);
                      }

                    })
            );
          }
        ),

      ],
    );
  }

}