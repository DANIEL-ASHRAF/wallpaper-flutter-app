import 'dart:convert';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/services/api.dart';

import 'app/app.locator.dart';
//TODO may be th rebuild of the images comes from doesn't make the apiService is singleton
class APIService{
  final api=locator<API>();
  var url = Uri.parse("https://api.pexels.com/v1/curated?per_page=50");
  List<Photo> photos= [];
  Future<dynamic?> getCuratedPhotos()async{
    final response=await http.get(url,
      headers:{'Authorization':api.apiKey}
    );
    print("${response.statusCode} 111111111111111111111111");
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      if(true){
       data["photos"].forEach((element)
           {
             final photo=  Photo.fromJson(element);
             photos.add(photo);
           });
       return photos;
      }
    }
//    throw response;
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
