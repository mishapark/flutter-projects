import 'dart:async';

import 'package:camera/camera.dart';
import 'package:camera_app/business/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? controller;
  XFile? image;

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(title: const Text('Camera Preview')),
        body: controller?.value.isInitialized == true
            ? LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: CameraPreview(controller!),
                ),
              )
            : const CircularProgressIndicator(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.camera),
          onPressed: () async {
            image = await controller?.takePicture();
            state.images.add(image!);
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _onNewCameraSelected(CameraDescription description) async {
    if (controller != null) {
      await controller!.dispose();
    }

    final CameraController cameraController = CameraController(
      description,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: true,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }
}
