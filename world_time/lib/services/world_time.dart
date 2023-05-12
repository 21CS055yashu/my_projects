import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location='';
  String time = '';
  String flag='';
  String urll='';
  bool isDaytime = true;

  WorldTime({required this.location, required this.flag,required this.urll});

  Future<void> getTime() async {
    try{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$urll'));
    Map data = json.decode(response.body);

    String datetime = data['datetime'];
    String offset = (data['utc_offset']).substring(1,3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour > 6 && now.hour < 12 ? true : false;
    time = DateFormat.jm().format(now);
    }catch(e){
      print('Caught error: $e');
      time = 'could not get the time data';
    }
    
  }
}