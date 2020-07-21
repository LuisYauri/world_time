import 'dart:convert';

import 'package:http/http.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
//    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);
//    print(datatime);
//    print(offset);
    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
  }
}