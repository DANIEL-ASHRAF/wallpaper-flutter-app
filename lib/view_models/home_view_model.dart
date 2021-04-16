import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/helper/constants/methods.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/services/api.dart';
import 'package:wallpaper_app/services/api_service.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';

enum FetchApi{
  search,
  trend,
  curated,
  endPoint
}

class HomeViewModel extends FutureViewModel<Photo?>{
  final apiService=locator<APIService>();
  List<CategoryModel> categories = [];
  List<Photo> photos=[];
  FetchApi fetchApi=FetchApi.curated;
  late String _search;
  late Endpoint endpoint;
  bool flag= true;
  void setSearch(String search){_search=search;}
  String get searchText =>_search;
  void getTheCategories(){
    categories=getCategories();
  }
   void chooseApi(){
      fetchApi=FetchApi.trend;
      flag=!flag;
      notifyListeners();
   }
  Future<Photo?> getCuratedPhotos()async{
    try{
      photos.clear();
      photos= await apiService.getCuratedPhotos();
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(e.toString());
    }
  }
  Future<Photo?> getTrendPhotos()async{
    try{
      photos.clear();
      photos= await apiService.getSearchPhotos("love");
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      print(e);
//      showErrorDialog(e);
    }finally{
      notifyListeners();
    }
  }
  Future<Photo?> getSearchPhotos()async{
    try{
      setBusy(true);
      photos.clear();
      photos= await apiService.getSearchPhotos(searchText);
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }finally{
      setBusy(false);
      notifyListeners();
    }
  }
  Future<Photo?> getEndpointPhotos()async{
    try{
      photos.clear();
      photos= await apiService.getEndpointPhotos(Endpoint.Nature);
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }finally{
      notifyListeners();
    }
  }

  @override
  Future<Photo?> futureToRun()=>getCuratedPhotos();


//  @override
//  futureToRun(){
//    switch(fetchApi){
//      case FetchApi.curated: {
//         getCuratedPhotos();
//         notifyListeners();
//      }break;
//      case FetchApi.trend: {
//         getTrendPhotos() ;
//         notifyListeners();
//      }break;
//      case FetchApi.search: {
//        return getSearchPhotos();
//      }case FetchApi.endPoint: {
//      return getEndpointPhotos();
//      }
//      default: {
//        return getCuratedPhotos();
//      }
//    }
//  }
}