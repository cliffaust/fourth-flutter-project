import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Paris', flag: 'assets/france.jpeg', url: 'Europe/Paris');

    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: Location(
        location: worldTime.location,
        flag: worldTime.flag,
        time: worldTime.time,
        isDay: worldTime.isDay,
    ));
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: SpinKitCubeGrid(
              color: Colors.white,
            )
            ),
          )
      ),
    );
  }
}
