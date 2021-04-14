import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/helper/constants/methods.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/services/api.dart';
import 'package:wallpaper_app/services/api_service.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';

const String _CuratedDelayFuture = 'delayedCurated';
const String _EndpointDelayFuture = 'delayedEndpoint';
const String _SearchDelayFuture = 'delayedSearch';

class HomeViewModel extends MultipleFutureViewModel{
  Photo get fetchedCuratedPhotos => dataMap![_CuratedDelayFuture];
  Photo get fetchedSearchPhotos => dataMap![_SearchDelayFuture];
  Photo get fetchedEndpointPhotos => dataMap![_EndpointDelayFuture];

  bool get fetchingCuratedPhotos => busy(_CuratedDelayFuture);
  bool get fetchingSearchPhotos => busy(_SearchDelayFuture);
  bool get fetchingEndpointPhotos => busy(_EndpointDelayFuture);

  final apiService=locator<APIService>();
  List<CategoryModel> categories = [];
  List<Photo> photos=[];
  late String search;
  late Endpoint endpoint;
  void getTheCategories(){
    categories=getCategories();
  }

  Future<Photo?> getCuratedPhotos()async{
   try{
     photos= await apiService.getCuratedPhotos();
   }on PlatformException catch(e){
     showErrorDialog(e.message);
   }catch(e){
     showErrorDialog(null);
   }
 }
  Future<Photo?> getSearchPhotos()async{
    try{
      photos= await apiService.getSearchPhotos("trend");
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }
  Future<Photo?> getEndpointPhotos()async{
    try{
      photos= await apiService.getEndpointPhotos(Endpoint.Nature);
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(null);
    }
  }

  @override
  Map<String, Future Function()> get futuresMap => {
    _CuratedDelayFuture: getCuratedPhotos,
    _SearchDelayFuture: getSearchPhotos,
    _EndpointDelayFuture:getEndpointPhotos
  };

}