import 'package:stacked/stacked.dart';
import 'file:///E:/Flutter_Apps/wallpaper_app/lib/services/categories.dart';
import 'package:wallpaper_app/models/category_model.dart';

class HomeViewModel extends BaseViewModel{
  List<CategoryModel> categories = [];
  void getTheCategories(){
    categories=getCategories();
  }
}