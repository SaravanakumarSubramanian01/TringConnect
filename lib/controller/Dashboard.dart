
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tringconnect/widgets/DashboardHeader.dart';
import 'package:tringconnect/widgets/FeedItem.dart';

import '../widgets/CourseFeedItem.dart';


class Dashboard extends StatefulWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard>{
  late DatabaseReference feedRef;

  Future<List<dynamic>> getApiData() async{
    List<dynamic> feeds = [];
    feedRef = FirebaseDatabase.instance.ref();
    final snapshot = await feedRef.child('feeds').get();
    for (DataSnapshot feedSnapshot in snapshot.children) {
      feeds.add(feedSnapshot.value);
    }
    return feeds.toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const DashboardHeader(),
        FutureBuilder(
          future: getApiData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('No feeds found.');
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Loading ...'),
              );
            }
            //return Container();
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