import 'dart:convert';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/services/api.dart';
import 'app/app.locator.dart';
class APIService{
  final api=locator<API>();
  List<Photo> photos= [];
  Future<dynamic?> getCuratedPhotos()async{
    final response=await http.get(api.curatedPhotosUri(),
      headers:{'Authorization':api.apiKey}
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      if(data.isNotEmpty){
       data["photos"].forEach((element)
           {
             final photo=Photo.fromJson(element);
             photos.add(photo);
           });
       return photos;
      }
      throw "No data";
    }
    throw "something wrong!!";
  }

  Future<dynamic?> getSearchPhotos(String search)async{
    final response=await http.get(api.searchUri(search),
        headers:{'Authorization':api.apiKey}
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      if(data.isNotEmpty){
        data["photos"].forEach((element)
        {
          final photo=Photo.fromJson(element);
          photos.add(photo);
        });
        return photos;
      }
      throw "No data";
    }
    throw "something wrong!!";
  }

  Future<dynamic?> getEndpointPhotos(Endpoint endpoint)async{
    final response=await http.get(api.endPointUri(endpoint),
        headers:{'Authorization':api.apiKey}
    );
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      if(data.isNotEmpty){
        data["photos"].forEach((element)
        {
          final photo=Photo.fromJson(element);
          photos.add(photo);
        });
        return photos;
      }
      throw "No data";
    }
    throw "something wrong!!";
  }

}
