import 'package:evently_app/features/location_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsTab extends StatefulWidget {
  const MapsTab({super.key});

  @override
  State<MapsTab> createState() => _MapsTabState();
}

class _MapsTabState extends State<MapsTab> {

  late GoogleMapController _controller; // da mas2ol y7rak el camera 3al map

  Marker? currentLocationMarker;
  var initialPosition =
      const CameraPosition(zoom: 12, target: LatLng(37.4219983, -122.084));
  //da mkan eftrady hybda2 meno el camera l7ad ma luser y7ded mkano


  @override
  void initState() {
    super.initState();
    _getUserLocation();
    // awll ma yfta7 el map y7ded location bta3 el user
  }
  Future<void> _getUserLocation() async {
    //bgeb el location
    var location = await LocationManager.getCurrentLocation();
    //baged el lat w lng
    var newLatLng = LatLng(location.latitude, location.longitude);

    setState(() {
      //b update l marker 3la asas el lat w lng el godad
      currentLocationMarker = Marker(
        markerId: const MarkerId("1"),
        position: newLatLng,
      );
    });

    // b7rak el camera 3la asas el lat w lng l godad
    _controller.animateCamera(
      CameraUpdate.newLatLngZoom(newLatLng, 14),
    );

    //m3 kol update lluser el marker yt7rak m3ah
    _listenOnLocationChange();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "uniqueFloatingActionButtonTag",
          onPressed:  _getUserLocation,
            child: const  Icon(Icons.my_location),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        key: UniqueKey(),
        markers: currentLocationMarker != null ? {currentLocationMarker!} : {},
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: initialPosition,
      ),
    );
  }

  _listenOnLocationChange() {
    var stream = Geolocator.getPositionStream();
    stream.listen((Position newLocation) {
      var newLatLng = LatLng(newLocation.latitude, newLocation.longitude);
      _controller.animateCamera(
        CameraUpdate.newLatLngZoom(
            newLatLng, 14
        ),
      );
      currentLocationMarker = Marker(
          markerId: MarkerId("1") ,
          position: newLatLng
      );
      setState(() {});
    }
    );
  }
}
