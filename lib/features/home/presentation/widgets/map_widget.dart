import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location locationController = Location();

  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  LatLng? currentPosition;
  LatLng sourceLocation = const LatLng(23.7599042, 90.410031);
  LatLng currentLocation = const LatLng(23.7699042, 90.400931);

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    getLocationUpdates().then((value) => getPolylinePoints()
        .then((coordinates) => {generatePolyLineFromPoints(coordinates)}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(
              child: Text("Give Location Permission"),
            )
          : GoogleMap(
              onMapCreated: (controller) {
                mapController.complete(controller);
              },
              initialCameraPosition:
                  CameraPosition(target: sourceLocation, zoom: 13),
              markers: {
                Marker(
                    markerId: const MarkerId("_currentLocation "),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentPosition!),
                Marker(
                    markerId: const MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: sourceLocation),
                Marker(
                    markerId: const MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentLocation),
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          cameraPosition(currentPosition!);
        });
      }
    });
  }

  Future<void> cameraPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 13);

    await controller
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> plyLineCoordinate = [];

    return plyLineCoordinate;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
