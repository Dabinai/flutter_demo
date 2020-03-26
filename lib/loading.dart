import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget{
  @override
 _LoadingState createState() => _LoadingState();
 
}

class _LoadingState extends State<LoadingPage>{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/loading.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Text(
                "Flutter Studio",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 36.0,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}