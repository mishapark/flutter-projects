import 'package:camera/camera.dart';
import 'package:camera_app/ui/views/camera_view.dart';
import 'package:camera_app/ui/views/gallery_view.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int currentPageIndex = 0;

  final List<Widget> views = [
    const CameraView(),
    const GalleryView(),
  ];

  final List<XFile> images = [];

  void changeTab(int i) {
    currentPageIndex = i;
  }
}
