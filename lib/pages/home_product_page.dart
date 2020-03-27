import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/product_model.dart';
import 'package:flutterdemo/pages/webview_page.dart';
import 'package:flutterdemo/style/colors.dart';

class HomeProductPage extends StatelessWidget {
  final List<DataProductElement> listData;

  const HomeProductPage({Key key, this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 7.5,
      ),
      child: _build(context, width),
    );
  }

  Widget _build(BuildContext context, double width) {
    double itemWidth = width * 168.5 / 360;
    double itemHeight = width * 110 / 360;

    var bgColor = ColorsUtil.hexToColor("#f8f8f8");
    var titleColor = ColorsUtil.hexToColor("#db541");
    var subtitleColor = ColorsUtil.hexToColor("#999999");
    List<Widget> listWidget = listData.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
            return WebViewPage(
              title: e.title,
              url: e.link,
            );
          }));
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(left: 2, bottom: 5),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                e.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 7,
                  color: titleColor,
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  e.envelopePic,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: bgColor,
          child: ListTile(
            title: Text(
              "推荐项目介绍",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),

          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidget,
        ),
      ],
    );
  }
}
