import 'package:flutter/material.dart';
import 'package:playback/ui/widgets/bottom_panel.dart';
import 'package:playback/ui/widgets/play.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  bool isShow = false;
  Duration position = const Duration(milliseconds: 0);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _controller.addListener(() {
      position = _controller.value.position;
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    PlayWidget(
                      controller: _controller,
                    ),
                    BottomPanel(controller: _controller, position: position),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
