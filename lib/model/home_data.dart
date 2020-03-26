import 'package:flutterdemo/conf/configure.dart';
import 'package:http/http.dart' as http;

getHomeData() async{
  var res = await http.get(Config.Home);
  String body = res.body;
  var json = 
}