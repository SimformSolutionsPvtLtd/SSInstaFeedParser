import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class AppVideo extends StatefulWidget {
  String videoUrl;
  String videoThumb;

  AppVideo({@required this.videoUrl, @required this.videoThumb});

  @override
  _AppVideoState createState() => _AppVideoState();
}

class _AppVideoState extends State<AppVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
    _controller.setLooping(true);
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: _controller.value.initialized
            ? VideoPlayer(_controller)
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  widget.videoThumb,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
