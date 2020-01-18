import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; // URL to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(dateTime);
      //print(offset);

      // create a DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      // Set the time property
      time = now.toString();
    } catch (e) {
      print('caught error: $e');
      time='Could not get time data';
    }
  }
}
