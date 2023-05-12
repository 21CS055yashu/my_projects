import 'dart:html';

import 'package:flutter/material.dart';
import '../services/world_time.dart';

List<WorldTime> list1 = [
  WorldTime(location: 'Chicago', flag: 'usa.png', urll: 'America/Chicago'),
  WorldTime(location: 'Nairobi', flag: 'south_korea.png', urll: 'Africa/Nairobi'),
  WorldTime(location: 'Seoul', flag: 'kenya.png', urll: 'Asia/Seoul'),
  WorldTime(location: 'London', flag: 'uk.png', urll: 'Europe/London'),
  WorldTime(location: 'Tokyo', flag: 'uk.png', urll: 'Asia/Tokyo'),

];

class ChooseLocation extends StatefulWidget{
  const ChooseLocation({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseLocation();
}

class _ChooseLocation extends State<ChooseLocation>{

  @override
  void initState() {
    super.initState();
  }

  void updateTime(index) async{
    WorldTime instance = list1[index];
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pop(context,{
      'location': list1[index].location,
      'flag': list1[index].flag,
      'time': list1[index].time,
      'isDaytime': list1[index].isDaytime
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: list1.length,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(list1[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(list1[index].flag),
                  )
              ),
            ),
          );
        },
        ),
    );
  }
}