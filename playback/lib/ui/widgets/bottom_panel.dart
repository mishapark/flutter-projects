import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BottomPanel extends StatelessWidget {
  final VideoPlayerController controller;
  final Duration position;

  const BottomPanel({
    super.key,
    required this.controller,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            Slider(
              onChangeStart: (_) => controller.pause(),
              onChangeEnd: (_) => controller.play(),
              onChanged: (value) =>
                  controller.seekTo(Duration(milliseconds: value.toInt())),
              value: position.inMilliseconds.toDouble(),
              min: 0,
              max: controller.value.duration.inMilliseconds.toDouble(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    position.toString().substring(2, 7),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    controller.value.duration.toString().substring(2, 7),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
