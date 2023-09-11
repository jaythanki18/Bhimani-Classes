import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlay extends StatefulWidget {

  String url,name;
  VideoPlay({
    required this.url,required this.name,
  });

  @override
  State<VideoPlay> createState() => _VideoPlayState(url:url,name:name);
}

class _VideoPlayState extends State<VideoPlay> {
  String url,name;

  _VideoPlayState({
    required this.url, required this.name,
  });

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;


  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(name),
      ),
      child: Scaffold(
        body: CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController
        ),
      ),
    );
  }
}