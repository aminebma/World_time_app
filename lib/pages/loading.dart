import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    // //simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   return 'yoshi';
    // });

    // String bio = await Future.delayed(Duration(seconds: 2), () {
    //   return 'music, judo & gamer' ;
    // });

    // print('$username - $bio');

    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('Hey there ! I\'m testing asynchronous programming !');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading Screen'))
    );
  }
}