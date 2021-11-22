import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/location.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'assets/uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'assets/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'assets/indonesia.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'assets/egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'assets/kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'assets/usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'assets/usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'assets/south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'assets/indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    print("Build the initial state");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0.0,
              margin: const EdgeInsets.only(top: 10.0),
              child: ListTile(
                onTap: () async {
                  WorldTime worldTime = WorldTime(location: locations[index].location, flag: locations[index].flag, url: locations[index].url);

                  await worldTime.getTime();

                  Navigator.pushReplacementNamed(context, "/home", arguments: Location(
                    location: worldTime.location,
                    flag: worldTime.flag,
                    time: worldTime.time,
                    isDay: worldTime.isDay,
                  ));
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    locations[index].location,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

