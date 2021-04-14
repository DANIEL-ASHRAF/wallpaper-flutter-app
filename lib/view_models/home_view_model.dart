import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/helper/constants/methods.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/secerts/api_key.dart';
import 'package:wallpaper_app/services/api.dart';
import 'package:wallpaper_app/services/api_service.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';

class HomeViewModel extends FutureViewModel<Photo?>{
  final apiService=locator<APIService>();
  List<CategoryModel> categories = [];
  List<Photo> photos=[];
  void getTheCategories(){
    categories=getCategories();
  }

 Future<Photo?> getData()async{
//   try{
     photos= await apiService.getCuratedPhotos();
//     return result;
//   }on PlatformException catch(e){
//     showErrorDialog(e.message);
//   }catch(e){
     print("aaaaaaaaaaaa");
//     showErrorDialog(null);
//   }
 }

 @override
  Future<Photo?> futureToRun()=>getData();
}