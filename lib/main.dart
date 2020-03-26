import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterdemo/loading.dart';

import 'app.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: mDefaultThemeData,
      routes: <String, WidgetBuilder>{
        "app" : (BuildContext context) => App(),
        "content_info": (BuildContext context) => WebviewScaffold(
              url: "https://mobile.hellocode.cn/",
              appBar: AppBar(
                title: Text("显示内容"),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("app");
                  },
                ),
              ),
            ),
      },
      home: LoadingPage(),
    ));

final ThemeData mDefaultThemeData = ThemeData(primaryColor: Colors.redAccent);
