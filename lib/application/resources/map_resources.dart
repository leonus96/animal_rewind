import 'package:extinct/domain/animal/animal.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapResources {
  final Map<String, CameraPosition> _values = {
    'dodo':
        const CameraPosition(target: LatLng(-20.283916, 57.565650), zoom: 8),
    'thylacine': const CameraPosition(
        target: LatLng(-42.266629500573266, 146.71787940482244), zoom: 5),
    'quagga':
        const CameraPosition(target: LatLng(28.5789392, 23.735958), zoom: 3),
    'pigeon':
        const CameraPosition(target: LatLng(46.8405922, -99.7751691), zoom: 3),
    'tortoise':
    const CameraPosition(target: LatLng(0.5916683,-90.7961449), zoom: 12),
    'bucardo':
    const CameraPosition(target: LatLng(42.0550537,-0.5181249), zoom: 5),
  };

  CameraPosition getMap(Animal animal) {
    return _values[animal.key]!;
  }
}
