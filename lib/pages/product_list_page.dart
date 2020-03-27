import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/product_model.dart';
import 'package:flutterdemo/pages/webview_page.dart';
import 'package:flutterdemo/style/colors.dart';

class ProductListPage extends StatelessWidget {
  final List<DataProductElement> listData;
  final VoidCallback getNextPage;

  const ProductListPage({Key key, this.listData, this.getNextPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listData.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(

            itemCount: listData.length,
            itemBuilder: (BuildContext context, int i) {
              var item = listData[i];
              if (i + 4 == listData.length) {
                getNextPage();
              }

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return new WebViewPage(title: item.title,url: item.link,);
                  }));
                },
                child: Container(
                  //分割线
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
                  ),
                  padding: EdgeInsets.only(
                    top: 5.0,
                    right: 5.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        item.envelopePic,
                        width: 120.0,
                        height: 120.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16.5,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Text(
                                item.desc,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              );
              return ListTile(
                title: Text(item.desc),
              );
            });
  }
}
