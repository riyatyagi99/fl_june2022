import 'dart:async';
import 'dart:collection';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsss extends StatefulWidget {
  const GoogleMapsss({Key? key}) : super(key: key);

  @override
  State<GoogleMapsss> createState() => _GoogleMapsssState();
}

class _GoogleMapsssState extends State<GoogleMapsss> {
  static const CameraPosition cp =
      CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 4);

  Completer<GoogleMapController> controller = Completer();
  String mapStyle = '';

  @override
  void initState() {
    markers.addAll(list);
    currentUpdateLocation();
    polygonList.add(Polygon(
        polygonId: PolygonId('1'),
        fillColor: Colors.red.withOpacity(0.3),
        points: polygonPoints,
        strokeWidth: 2,
        strokeColor: Colors.red,
        geodesic: true));

// showing maarkers on polyline
    for (int i = 0; i < polylinnePoints.length; i++) {
      print("Polylineeeeeee");
      polyLineMarkers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: polylinnePoints[i],
          infoWindow: const InfoWindow(title: "PolyLine Kaisa lg rha hai?")));
    }
    setState(() {});
    polylinneList.add(Polyline(
        polylineId: PolylineId('4567'),
        color: Colors.deepPurpleAccent,
        points: polylinnePoints,
        width: 2));
    super.initState();

  }

  //Polygon
  Set<Polygon> polygonList = HashSet<Polygon>();
  List<LatLng> polygonPoints = <LatLng>[
    LatLng(22.987654, 78.98765),
    LatLng(24.987654, 80.98765),
    LatLng(25.987654, 81.98765),
    LatLng(22.987654, 79.98765),
  ];

  //PolyLine
  Set<Polyline> polylinneList = {};
  Set<Marker> polyLineMarkers = {};
  List<LatLng> polylinnePoints = <LatLng>[
    LatLng(18.987654, 78.98765),
    LatLng(19.987654, 80.98765),
    LatLng(20.987654, 81.98765),
    LatLng(21.987654, 82.98765),
  ];

  List<Marker> markers = [];
  List<Marker> list = [
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(18.987654, 79.98765),
        infoWindow: InfoWindow(title: "My position 2"))
  ];
  String? address = "Address";
  String? latlngg = "LatLng";

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("$error    Erroooooooor");
    });
    return await Geolocator.getCurrentPosition();
  }

  currentUpdateLocation() {
    getCurrentLocation().then((value) async {
      print("My coordinatesss aree     ${value.latitude}, ${value.longitude}");
      markers.add(Marker(
          markerId: MarkerId('Current'),
          position: LatLng(value.longitude, value.latitude),
          infoWindow: InfoWindow(title: 'Current Pos')));
      CameraPosition cammPos = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14);
      print("$cammPos   hellllllo");
      GoogleMapController gmc = await controller.future;

      gmc.animateCamera(CameraUpdate.newCameraPosition(cammPos));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Can change theme"),
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        controller.future.then((value) {
                          DefaultAssetBundle.of(context)
                              .loadString('assets/map_theme/retro_theme.json')
                              .then((string) {
                            setState(() {});
                            value.setMapStyle(string);
                          });
                        }).catchError((error) {
                          print("error" + error.toString());
                        });
                      },
                      child: Text("Retro"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        controller.future.then((value) {
                          DefaultAssetBundle.of(context)
                              .loadString('assets/map_theme/night_theme.json')
                              .then((string) {
                            setState(() {});
                            value.setMapStyle(string);
                          });
                        }).catchError((error) {
                          print("error" + error.toString());
                        });
                      },
                      child: Text("Night"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        controller.future.then((value) {
                          DefaultAssetBundle.of(context)
                              .loadString('assets/map_theme/silver_theme.json')
                              .then((string) {
                            setState(() {});
                            value.setMapStyle(string);
                          });
                        }).catchError((error) {
                          print("error" + error.toString());
                        });
                      },
                      child: Text("Silver"),
                      value: 2,
                    ),
                  ])
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("$address   "),
            Text("$latlngg"),
            ElevatedButton(
                onPressed: () async {
                  // Geolocator pkg- current poition
                  // Geocoding- convert latlng to address and viceversa

                  List<Location> locations =
                      await locationFromAddress("Noida 201301, India");
                  List<Placemark> placemarks =
                      await placemarkFromCoordinates(20.987654, 78.98765);

                  setState(() {
                    address = locations.last.longitude.toString() +
                        " , " +
                        locations.last.latitude.toString();
                    latlngg = placemarks.reversed.last.country.toString() +
                        placemarks.reversed.last.locality.toString();
                  });
                },
                child: Text("Convert")),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: cp,
                markers: polyLineMarkers,
                mapType: MapType.normal,
                compassEnabled: true,
                polygons: polygonList,
                polylines: polylinneList,
                // myLocationEnabled: true,
                //myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controllerr) {
                  controllerr.setMapStyle(mapStyle);
                  controller.complete(controllerr);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Follow this youtube channel for more
//https://www.youtube.com/watch?v=zV5ToAGiM6U&list=PLFyjjoCMAPtyIDJK6rt3STCQOFPv7CPPg&index=16&ab_channel=TheTechBrothers