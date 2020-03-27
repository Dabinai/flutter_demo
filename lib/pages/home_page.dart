import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/conf/config.dart';
import 'package:flutterdemo/model/banner_model.dart';
import 'package:flutterdemo/model/product_model.dart';
import 'package:http/http.dart' as http;

import 'home_banner_page.dart';
import 'home_product_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Datum> listBanner = new List();
  List<DataProductElement> listData = new List();

  void getHomeDataList() async {
    var banrRes = await http.get(Config.Banner);
    String bannerBody = banrRes.body;
    var bannerData = bannerDataFromJson(bannerBody);

    var res = await http.get(Config.Home);
    String body = res.body;
//    print(body);
    var homeData = productDataFromJson(body);
    setState(() {
      listData.addAll(homeData.data.datas);
      listBanner.addAll(bannerData.data);
    });
  }

  @override
  void initState() {
    getHomeDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return listBanner.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: ListView(
              children: <Widget>[
                BannerWidget(listBanner: listBanner),
                HomeProductPage(listData: listData),
              ],
            ),
          );
  }
}
