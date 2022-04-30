
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tringconnect/widgets/DashboardHeader.dart';
import 'package:tringconnect/widgets/FeedItem.dart';


class Dashboard extends StatefulWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}
Future<List> getData(context) async {
  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/data.json');
  final body =  await json.decode(data);
  return body;
}
class DashboardState extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const DashboardHeader(),
        FutureBuilder(
          future: getData(context),
          builder: (context, snapshot) {
            debugPrint(snapshot.toString());
            if (snapshot.hasError) {
              return const Text('No feeds found.');
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading ...');
            }
            return  Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (context, index) {
                      return const FeedItem();
                    })
            );
          }
        ),

      ],
    );
  }

}