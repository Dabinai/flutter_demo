import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo/model/banner_model.dart';
import 'package:flutterdemo/pages/webview_page.dart';

class BannerWidget extends StatelessWidget{
  final List<Datum> listBanner;



  const BannerWidget({Key key, this.listBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width  = MediaQuery.of(context).size.width;
    double height  =width * 540.0/1000.0;

    return Container(
      margin: EdgeInsets.only(top: 5),
      width: width,
      height: height,
      child: Swiper(
        onTap: (index){
          Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
            return WebViewPage(title: listBanner[index].title,url: listBanner[index].url);
          }));
        },
        itemBuilder: (BuildContext context,index){
          return Container(
            margin: EdgeInsets.only(left: 5,right: 5),
            child: Image.network(
              listBanner[index].imagePath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: listBanner.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }


}