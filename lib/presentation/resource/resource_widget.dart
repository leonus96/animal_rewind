import 'package:extinct/application/resources/map_resources.dart';
import 'package:extinct/domain/animal/animal.dart';
import 'package:extinct/presentation/resource/resource_image_view_page.dart';
import 'package:extinct/presentation/resource/resource_map_view_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResourceWidget extends StatelessWidget {
  final Animal animal;
  final String resourceKey;

  const ResourceWidget({
    super.key,
    required this.animal,
    required this.resourceKey,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Builder(
        builder: (context) {
          if (resourceKey.startsWith('img_')) {
            final assetPath =
                'assets/resources/${animal.key}/$resourceKey.jpg';
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResourceImageViewPage(path: assetPath),
                  ),
                );
              },
              child: Image.asset(assetPath),
            );
          } else if (resourceKey.startsWith('map_')) {
            final target = MapResources().getMap(animal);
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResourceMapViewPage(target: target.target),
                  ),
                );
              },
              child: SizedBox(
                height: 250,
                child: IgnorePointer(
                  child: GoogleMap(
                    initialCameraPosition: target,
                    mapToolbarEnabled: false,
                    zoomControlsEnabled: true,
                    compassEnabled: false,
                    myLocationButtonEnabled: false,
                  ),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
