import 'package:flutter/material.dart';
import 'package:world_time/services/location.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Map data = {};

  @override
  Widget build(BuildContext context) {

    final location = ModalRoute.of(context)!.settings.arguments as Location;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Home"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/location");
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text("Edit Location")
              ),
              const SizedBox(height: 40.0,),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(location.flag),
              ),
              const SizedBox(height: 10.0,),
              Center(
                child: Text(
                    location.location,
                  style: const TextStyle(
                      fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 5.0,),
              Center(
                child: Text(
                    location.time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
