import 'dart:io';

import 'package:camera_app/business/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(title: const Text('Gallery Images')),
        body: ListView(
          children: state.images
              .map(
                (image) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                        File(image.path),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
