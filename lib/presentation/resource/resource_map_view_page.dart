import 'package:extinct/presentation/widgets/app_bar_leading_button/app_bar_leading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResourceMapViewPage extends StatelessWidget {
  final LatLng target;

  const ResourceMapViewPage({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarLeadingButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: target,
          zoom: 10,
        ),
        mapToolbarEnabled: true,
        zoomControlsEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: false,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
