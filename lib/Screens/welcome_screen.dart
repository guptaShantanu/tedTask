import 'package:flutter/material.dart';
import 'package:tedtask/Screens/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startAnimation();
  }

  void startAnimation(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('TED',
        style: TextStyle(
          fontFamily: 'MontAlt',
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),),
      ),
    );
  }
}
