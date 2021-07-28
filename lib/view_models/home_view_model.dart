import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallpaper_app/data/categories.dart';
import 'package:wallpaper_app/helper/constants/methods.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/services/api.dart';
import 'package:wallpaper_app/services/api_service.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';
import 'package:wallpaper_app/views/image_view.dart';

class HomeViewModel extends FutureViewModel<Photo?>{
  final apiService=locator<APIService>();
  List<CategoryModel> categories = [];
  List<Photo> photos=[];
  late String _search;
  late Endpoint endpoint;
  String? _doNotRepeat;
  bool flag= true;
  bool _isItGrid=true;
  void setViewStyle(){_isItGrid=!_isItGrid;notifyListeners();}
  bool get isItGrid=>_isItGrid;
  void setSearch(String search){_search=search;}
  String get searchText =>_search;
  void getTheCategories(){
    categories=getCategories();
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
  //TODO if we need to make the refresh indicator we will add flag for it to enter in the if condition
  Future<Photo?> getSearchPhotos()async{
    try{
      if( _doNotRepeat!=searchText){
        setBusy(true);
        photos.clear();
        photos= await apiService.getSearchPhotos(searchText);
        _doNotRepeat=searchText;
      }
    }on PlatformException catch(e){
      showErrorDialog(e.message);
    }catch(e){
      showErrorDialog(e.toString());
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

  NavigationService _navigationService=locator<NavigationService>();

//navigation without animation
  Future navigateWithoutAnimation(String imageUrl)async{
    await _navigationService.navigateWithTransition(ImageView(imageUrl: imageUrl),transition:"",duration: Duration(seconds: 0));
  }

  @override
  Future<Photo?> futureToRun()=>getCuratedPhotos();

}