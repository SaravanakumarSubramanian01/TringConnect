import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import '../utils/app_constants.dart';

class CommentHeader extends StatelessWidget {
  const CommentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(1),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 8,
                          child: ClipOval(
                            child: Image(
                                fit: BoxFit.cover,
                                width: 16,
                                height: 16,
                                image: NetworkImage(Api.imageURL + '100')),
                          ),
                        ))),
                Positioned(
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(1),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 8,
                        child: ClipOval(
                          child: Image(
                              fit: BoxFit.cover,
                              width: 16,
                              height: 16,
                              image: NetworkImage(Api.imageURL + '101')),
                        ),
                      ),
                    )),
                Positioned(
                  left: 16,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(1),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 8,
                        child: ClipOval(
                          child: Image(
                              fit: BoxFit.cover,
                              width: 16,
                              height: 16,
                              image: NetworkImage(Api.imageURL + '102')),
                        ),
                      )),
                )
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.left,
            softWrap: true,
            text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "Liked by ",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: "Saravana ",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "and ",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: "209 Others",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ]),
          ),
        ],
      ),
    );
  }
}
