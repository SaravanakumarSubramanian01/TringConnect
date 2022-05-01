import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:video_player/video_player.dart';

class MediaViewer extends StatefulWidget {
  const MediaViewer({Key? key}) : super(key: key);

  @override
  State<MediaViewer> createState() => MediaViewerState();
}

class MediaViewerState extends State<MediaViewer> {
  late VideoPlayerController _controller;
  late String mediaUrl;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    return Container(
      color: CustomColor.white,
      child: CarouselSlider.builder(
        itemCount: arg.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Builder(builder: (context) {
          if (arg[itemIndex]['type'] == 'image') {
            return Image(
              width: MediaQuery.of(context).size.width,
              height: 230,
              image: NetworkImage(arg[itemIndex]['mediaUrl']),
              fit: BoxFit.cover,
            );
          } else {
            return Material(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      GestureDetector(
                        onTap: () {
                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                        },
                      ),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 0,
        ),
      ),
    );
  }
}
