import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/contact_page.dart';
import 'package:flutterdemo/pages/webview_page.dart';

class AboutUsPage extends StatefulWidget{

  @override
  AboutUsState createState() => AboutUsState();
}

class AboutUsState extends State<AboutUsPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/about.jpg",
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("WANAndroid社区"),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return WebViewPage(title: "WANAndroid社区",url: "https://wanandroid.com/");
                }));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text("少儿编程"),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return WebViewPage(title: "少儿编程",url: "https://mobile.hellocode.cn/");
                }));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text("联系我们"),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder:(context) => ContactPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

}