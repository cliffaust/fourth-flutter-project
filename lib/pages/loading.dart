import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Paris', flag: 'france.jpeg', url: 'Europe/Paris');

    await worldTime.getTime();
    time = worldTime.time;

    setState(() {
      time = time;
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(time),
          )
      ),
    );
  }
}
