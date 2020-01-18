import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //void getData() async {
  //simulate network request for a username and its bio
  // String username = await Future.delayed(Duration(seconds: 3), () {
  //   return 'yoshi';
  // });

  // String bio = await Future.delayed(Duration(seconds: 2), () {
  //   return 'music, judo & gamer' ;
  // });

  // print('$username - $bio');

  // testing the http package
  //   Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      flag: 'algeria.png',
      location: 'Algiers',
      url: 'Africa/Algiers',
    );
    await instance.getTime();
    print(instance.time);
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print('Hey there ! I\'m testing asynchronous programming !');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitChasingDots(
        color: Colors.black,
        size: 50.0,
      ),
    ));
  }
}
