import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response resonse =
        await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(resonse.body);
//    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);
//    print(datatime);
//    print(offset);
    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
