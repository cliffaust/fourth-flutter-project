import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({required this.location, required this.time, required this.flag, required this.url});

  void getTime() async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(datetime);

    now = now.add(Duration(hours: int.parse(offset)));

    print(now);
  }
}