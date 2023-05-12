import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';
// import 'package: http/http.dart';

class Loading extends StatefulWidget{
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() => _Loading();
}

class _Loading extends State<Loading>{

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', urll: 'Europe/Berlin');
    await instance.getTime();

    // ignore: use_build_context_synchronously
    Map map1 = {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    };

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home',arguments: map1);
  }

 
  @override
  void initState(){
    setupWorldTime();
    super.initState();
  }
 @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: SpinKitFadingCircle(
  color: Colors.white,
  size: 50.0,
),
      ),
    );
  }
}