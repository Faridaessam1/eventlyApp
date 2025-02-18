import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationManager {

  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

// awel 7aga n check el app le access ll location wla la
    permission = await Geolocator.checkPermission();
//lw malosh bshof hwa denied wl denied forever
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ) {

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
// at2aked el location mfto7 3la el mobile nfso
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //lw msh mafto7 yb2a fe access mn el app nfso aro7 ll settings location 3la tol
     var result = await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
// bageb el current location lat w long
    var location = await Geolocator.getCurrentPosition();
    print(location.toString());

    return location;
  }



}