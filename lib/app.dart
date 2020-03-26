import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/home_page.dart';

import 'pages/about_us_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget{

  @override
  AppState createState() => AppState();
}

class AppState extends State<App>{

  var _currentIndex = 0;

  HomePage _homePage;
  ProductPage _productPage;
  NewsPage _newsPage;
  AboutUsPage _aboutUsPage;


  currentPage(){
    switch(_currentIndex){
      case 0:
        if(_homePage == null){
          _homePage = HomePage();
        }
        return _homePage;
      case 1:
        if(_productPage == null){
          _productPage = ProductPage();
        }
        return _productPage;
      case 2:
        if(_newsPage == null){
          _newsPage = NewsPage();
        }
        return _newsPage;
      case 3:
        if(_aboutUsPage == null){
          _aboutUsPage = AboutUsPage();
        }
        return _aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dabin"),
        leading: Icon(Icons.home),
        actions: <Widget>[
          //右側内边距
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.search,
              ),
            ),
          )
        ],

      ),

      body: currentPage(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("首页"),
            icon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            title: Text("产品"),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text("新闻"),
            icon: Icon(Icons.fiber_new),
          ),
          BottomNavigationBarItem(
            title: Text("我的"),
            icon: Icon(Icons.account_box),
          )
        ],
      ),
    );
  }

}