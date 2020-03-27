import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/news_data.dart';
import 'package:flutterdemo/style/colors.dart';

class NewsListPage extends StatelessWidget {
  final List<Datum> listData;

  const NewsListPage({Key key, this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return listData.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int i) {
              return Wrap(
                  spacing: 10,
                  children: listData.map<Widget>((s) {
                    return Chip(
                      backgroundColor: ColorsUtil.getChipBgColor(s.name),
                      label: Text('${s.name}'),
                    );
                  }).toList());
            });
  }
}
