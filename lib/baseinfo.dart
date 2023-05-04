
import 'package:http/http.dart' as http;

const String baseURLEVENT = 'https://track.milac.com.mx/MilacServices/EventTrac/api';
class BaseInfo{
  var info = http.Client();
  //GET
  Future<dynamic> get(String api) async{
    var url = Uri.parse(baseURLEVENT + api);
 
    var response  = await info.get(url);
    if(response.statusCode == 200) return response.body;
    else {
      
    }
  
  }
}