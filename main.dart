import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MyWidget(),
    );
  }
}



class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double distanceInMeters_ = 0.0;

  void _calculateDistance() {

    // Coordinate Bandara KNO
    double startLatitude = 3.633825;
    double startLongitude = 98.877304;

    //Coordinate Bandara SUTTA
    double endLatitude = -6.125556;
    double endLongitude = 106.655830;

    distanceInMeters_ = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
   print("DistanceInMeters = ${distanceInMeters_} meters");

  }

@override
  void initState() {
    // TODO: implement initState
    _calculateDistance();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Calculate distance between\ntwo coordinate locations on the earth"),
      ),
      
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text("Coordinate Location Bandara Kualanamu, Medan:"),
          const Text("startLatitude = 3.633825"),
          const Text("startLongitude = 98.877304\n"),
          const Text("Coordinate Location Bandara Sukarno Hatta, Jakarta:"),
          const Text("endLatitude = -6.125556"),
          const Text("endLongitude = 106.655830"),
          Text("\nDistanceInMeters = ${distanceInMeters_} meters\n"),

        ],
      ),
    );
  }
}
