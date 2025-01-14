import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeroVideo extends StatefulWidget {
  const HeroVideo({super.key});

  @override
  State<HeroVideo> createState() => _HeroVideoState();
}

class _HeroVideoState extends State<HeroVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/hero-r-loop.mp4');
    _controller.setLooping(true);
    _controller.initialize().then((_)async {
      setState(() {});
      await Future.delayed(Duration(milliseconds: 1000));
      _controller.play();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var fixedWidth = _controller.value.size.width<_controller.value.size.height?_controller.value.size.width:_controller.value.size.height;
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: fixedWidth,
              height:fixedWidth,
                  child: VideoPlayer(_controller),
            ),
          ),
        ),
        //FURTHER IMPLEMENTATION
      ],
    );
  }
}
