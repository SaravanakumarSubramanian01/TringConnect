import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
class DynamicMediaRenderer extends StatelessWidget {
  final List<dynamic> mediaData;

  const DynamicMediaRenderer({Key? key, required this.mediaData})
      : super(key: key);

  Widget singleImageView(mediaData, context) {
    if(mediaData[0]['type'] == 'image'){
      return Image(
        width: MediaQuery.of(context).size.width,
        height: 230,
        image: NetworkImage(mediaData[0]['mediaUrl']),
        fit: BoxFit.cover,
      );
    }else{
      return Container();
    }
  }

  Row twoImageView(mediaData, context) {
    return Row(
      children: [
         Flexible(
            flex: 1,
            child: Image(
              width: MediaQuery.of(context).size.width * .5,
              height: 230,
              image: NetworkImage(mediaData[0]['mediaUrl']),
              fit: BoxFit.cover),
        ),
        Flexible(
          flex: 1,
          child: Image(
            width: MediaQuery.of(context).size.width * .5,
            height: 230,
            image: NetworkImage(mediaData[1]['mediaUrl']),
            fit: BoxFit.cover),
        )

      ],
    );
  }

  Row threeImageView(mediaData, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,

          child:Container(
              margin: const EdgeInsets.only(right: 2),
              child:Image(
                width: MediaQuery.of(context).size.width * .62,
                height: 230,
                image: NetworkImage(mediaData[0]['mediaUrl']),
                fit: BoxFit.cover)
          )
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    padding: const EdgeInsets.only(top:4,left: 2,),
                    child:Image(
                      width: MediaQuery.of(context).size.width * .35,
                      height: 115,
                      image: NetworkImage(mediaData[1]['mediaUrl']),
                      fit: BoxFit.cover
                    )
                  )
            ),
            Flexible(
                    flex: 1,
                    fit: FlexFit.loose,

                  child:Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.only(bottom:4,left: 2,),
                    child:Image(
                      width: MediaQuery.of(context).size.width * .35,
                      height: 115,
                      image: NetworkImage(mediaData[2]['mediaUrl']),
                      fit: BoxFit.cover)
                )
            )

          ],
        )
      ],
    );
  }

  Row fourImageView(mediaData, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child:Container(
              margin: const EdgeInsets.only(right: 2),
              child: Image(
                  width: MediaQuery.of(context).size.width * .60,
                  height: 230,
                  image: NetworkImage(mediaData[0]['mediaUrl']),
                  fit: BoxFit.cover),
            ),

        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      padding: const EdgeInsets.only(top:4,left: 2,),
                      child: Image(
                      width: MediaQuery.of(context).size.width * .35,
                      height: 115,
                      image: NetworkImage(mediaData[1]['mediaUrl']),
                      fit: BoxFit.cover),
                  )
            ),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                    width: MediaQuery.of(context).size.width * .35,
                    height: 115,
                    margin: const EdgeInsets.only(top: 2),
                    padding: const EdgeInsets.only(bottom:4,left: 2,),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                            width: MediaQuery.of(context).size.width * .5,
                            height: 115,
                            image: NetworkImage(mediaData[2]['mediaUrl']),
                            fit: BoxFit.cover),
                        Positioned(
                          child: Text(
                            "+"+(mediaData.length - 2).toString(),
                            style: const TextStyle(fontSize: 28,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: CustomColor.grey,),
                          ),
                        )
                      ],
                    )
                ),
            )
          ],
        )
      ],
    );
  }

  Widget renderImage(List<dynamic> mediaData, context) {
    int count = mediaData.length;
    switch (count) {
      case 1:
        return singleImageView(mediaData, context);
      case 2:
        return twoImageView(mediaData, context);
      case 3:
        return threeImageView(mediaData, context);
      case 4:
        return fourImageView(mediaData, context);
      default:
        return fourImageView(mediaData, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: renderImage(mediaData, context),
    );
  }
}
