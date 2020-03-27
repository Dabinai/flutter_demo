import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/conf/config.dart';
import 'package:flutterdemo/model/models.dart';
import 'package:flutterdemo/model/product_model.dart';
import 'package:flutterdemo/pages/product_list_page.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget{

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<ProductPage>{
  List<DataProductElement> listData = new List();

  void getHomeDataList() async {

    var res = await http.get(Config.Product);
    String body = res.body;
    print(body);
    var productData = productDataFromJson(body);
    setState(() {
      listData.addAll(productData.data.datas);
//      print("我来了--->${listData[0].title}");
    });
  }

  @override
  void initState() {
    getHomeDataList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

//    return Text("product");
    return ProductListPage(listData: listData,getNextPage: () => getHomeDataList());
  }

}