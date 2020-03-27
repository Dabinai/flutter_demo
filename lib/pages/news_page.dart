import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/conf/config.dart';
import 'package:flutterdemo/model/news_data.dart';
import 'package:http/http.dart' as http;

import 'news_list_page.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<NewsPage> {
  List<Datum> listData = new List();

  void getHomeDataList() async {
    var res = await http.get(Config.News);
    String body = res.body;
    print(body);
    var productData = newsDataFromJson(body);
    setState(() {
      listData.addAll(productData.data);
    });
  }

  @override
  void initState() {
    getHomeDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewsListPage(listData: listData,);
  }
}
