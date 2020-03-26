import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/about_us_page.dart';
import 'package:flutterdemo/pages/news_page.dart';
import 'package:flutterdemo/pages/product_page.dart';

import 'home_banner_page.dart';

class HomePage extends StatefulWidget{

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
        ],
      ),
    );
  }

}