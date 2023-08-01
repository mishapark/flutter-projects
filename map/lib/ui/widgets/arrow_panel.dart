import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/ui/widgets/map_icon_button.dart';

class ArrowPanel extends StatelessWidget {
  final GoogleMapController? controller;
  const ArrowPanel({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MapIconButton(
          icon: const Icon(Icons.arrow_drop_up),
          iconSize: 40,
          onTap: () {
            controller?.animateCamera(CameraUpdate.scrollBy(0, -50));
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MapIconButton(
              icon: const Icon(Icons.arrow_left),
              iconSize: 40,
              onTap: () {
                controller?.animateCamera(CameraUpdate.scrollBy(-50, 0));
              },
            ),
            const SizedBox(
              width: 5,
            ),
            MapIconButton(
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 40,
              onTap: () {
                controller?.animateCamera(CameraUpdate.scrollBy(0, 50));
              },
            ),
            const SizedBox(
              width: 5,
            ),
            MapIconButton(
              icon: const Icon(Icons.arrow_right),
              iconSize: 40,
              onTap: () {
                controller?.animateCamera(CameraUpdate.scrollBy(50, 0));
              },
            ),
          ],
        )
      ],
    );
  }
}
