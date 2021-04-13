import 'dart:convert';
import 'package:wallpaper_app/services/api.dart';
import 'package:http/http.dart' as http;

class APIService{
  APIService(this.api);
  final API api;

  Future getCuratedPhotos()async{
    final response=await http.get(
      api.curatedPhotosUri(),
      headers:{'Authorization':'${api.apiKey}'}
    );
    if(response.statusCode==200){
      final data=json.decode(response.body);
      if(data.isNotEmpty){
        //foreach or map
        print(data);
//        Photo photo=Photo.fromJson(data);
      }
    }
  }

  Future getEndPointData({required Endpoint endpoint})async{
    final response=await http.get(
        api.endPointUri(endpoint),
        headers:{'Authorization':'${api.apiKey}'}
    );
    if(response.statusCode==200){
      final data=json.decode(response.body);
      if(data.isNotEmpty){

      }
    }
  }


}
