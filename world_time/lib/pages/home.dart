import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);

    String bgImage = data['isDaytime'] ? 'day2.png' : 'night2.png';
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location_sharp),
                      label: data['isDaytime']
                          ? const Text(
                              'Edit Location',
                              style: TextStyle(color: Colors.black),
                            )
                          : const Text(
                              'Edit Location',
                              style: TextStyle(color: Colors.white),
                            ),
                      style: data['isDaytime']
                          ? const ButtonStyle(
                              iconColor: MaterialStatePropertyAll(Colors.black))
                          : const ButtonStyle(
                              iconColor:
                                  MaterialStatePropertyAll(Colors.white)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data['isDaytime']
                            ? Text(
                                data['location'],
                                style: const TextStyle(
                                    fontSize: 28, letterSpacing: 2.0),
                              )
                            : Text(
                                data['location'],
                                style: const TextStyle(
                                    fontSize: 28,
                                    letterSpacing: 2.0,
                                    color: Colors.white),
                              )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    data['isDaytime']
                        ? Text(
                            data['time'],
                            style:
                                const TextStyle(fontSize: 66, letterSpacing: 4),
                          )
                        : Text(
                            data['time'],
                            style: const TextStyle(
                                fontSize: 66,
                                letterSpacing: 4,
                                color: Colors.white),
                          )
                  ],
                ),
              ).asGlass(
                  clipBorderRadius: const BorderRadius.all(Radius.circular(30))),
            ],
          ),
        ],
      ),
    )));
  }
}
