import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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

  void getTime() async {
    // make the request 
    Response response = await get('http://worldtimeapi.org/api/timezone/Africa/Algiers');
    Map data = jsonDecode(response.body);
    //print(data);

    // get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(dateTime);
    //print(offset);
    
    // create a DateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }
  
  @override
  void initState() {
    super.initState();
    getTime();
    print('Hey there ! I\'m testing asynchronous programming !');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen'))
    );
  }
}