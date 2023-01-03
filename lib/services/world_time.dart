import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location; //location name for UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoints
  bool isDaytime;
  WorldTime(this.location, this.flag, this.url, this.time,this.isDaytime);

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);
      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 12 && now.hour<24 ? false : true;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error:$e');
      time = 'could not get time';
    }
  }
}
