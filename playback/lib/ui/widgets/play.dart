import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const PlayWidget({super.key, required this.controller});

  @override
  State<PlayWidget> createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  Future movePosition(Duration seconds) async {
    Duration? currentPosition = await widget.controller.position;
    Duration? newPosition = currentPosition! + seconds;
    await widget.controller.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 35,
            onPressed: () async {
              movePosition(const Duration(seconds: -10));
            },
            icon: const Icon(
              Icons.replay_10,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            iconSize: 80,
            onPressed: () {
              widget.controller.value.isPlaying
                  ? widget.controller.pause()
                  : widget.controller.play();
            },
            icon: Icon(
              widget.controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            iconSize: 35,
            onPressed: () async {
              movePosition(const Duration(seconds: -10));
            },
            icon: const Icon(
              Icons.forward_10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
