import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterdemo/pages/about_us_page.dart';
import 'package:flutterdemo/pages/news_page.dart';
import 'package:flutterdemo/pages/product_page.dart';

class BannerWidget extends StatelessWidget{
  List<String> banners = <String>[
    "assets/images/banner/one.jpg",
    "assets/images/banner/two.jpg",
    "assets/images/banner/there.jpg",
    "assets/images/banner/four.jpg",
  ];

  @override
  Widget build(BuildContext context) {

    double width  = MediaQuery.of(context).size.width;
    double height  =width * 540.0/1000.0;

    return Container(
      margin: EdgeInsets.only(top: 5),
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context,index){
          return Container(
            margin: EdgeInsets.only(left: 5,right: 5),
            child: Image.asset(
              banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
      ),
    );
  }


}