import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:tringconnect/widgets/AddBubble.dart';
import 'package:tringconnect/widgets/StoryBubble.dart';

class DashboardHeader extends StatelessWidget{
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late DatabaseReference bubbleRef;

    Future<List<dynamic>> getBubbles() async{
      List<dynamic>  bubbles = [];
      bubbleRef = FirebaseDatabase.instance.ref();
      final snapshot = await bubbleRef.child('bubbles').get();
      for (DataSnapshot bubbleSnapshot in snapshot.children) {
        bubbles.add(bubbleSnapshot.value);
      }
      return bubbles.toList();
    }
    return Container(
        height: 96,
        color: CustomColor.white,
        padding: const EdgeInsets.only(top: 8,left: 20),
        child: FutureBuilder(
          future: getBubbles(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('No bubbles found.');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(

                child: Text('Loading ...'),
              );
            }
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        AddBubble(),
                        Text("")
                      ],
                    );
                  }
                  return StoryBubble(
                    imageUrl: snapshot.data[index]['imageUrl'],
                    label: snapshot.data[index]['label'],
                    isOnline: snapshot.data[index]['isOnline'],
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(
                  width: 8,
                )
            );
          }
        )


    );
  }

}