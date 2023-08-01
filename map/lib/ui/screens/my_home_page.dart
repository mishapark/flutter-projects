import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map/ui/widgets/arrow_panel.dart';
import 'package:map/ui/widgets/map_icon_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? _controller;
  double sliderValue = 14;

  static const CameraPosition _newYork =
      CameraPosition(target: LatLng(40.717282, -74.003395), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _newYork,
            mapType: MapType.hybrid,
            onMapCreated: (controller) {
              _controller = controller;
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ArrowPanel(
                controller: _controller,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    min: 1,
                    max: 30,
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                      _controller
                          ?.animateCamera(CameraUpdate.zoomTo(sliderValue));
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MapIconButton(
                icon: const Icon(Icons.my_location),
                iconSize: 30,
                onTap: () {
                  setState(() {
                    sliderValue = 14;
                  });
                  _controller
                      ?.animateCamera(CameraUpdate.newCameraPosition(_newYork));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
