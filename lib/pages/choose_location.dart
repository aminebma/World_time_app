import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
 
  void getData() async {
    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'yoshi';
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'music, judo & gamer' ;
    });

    print('$username - $bio');
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Text('Choose Location Screen'),
    );
  }
}
