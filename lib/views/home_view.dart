import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:wallpaper_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:wallpaper_app/helper/common_widgets/empty_content.dart';
import 'package:wallpaper_app/helper/common_widgets/list_items_builder.dart';
import 'package:wallpaper_app/helper/common_widgets/responsive_sensitive.dart';
import 'package:wallpaper_app/helper/common_widgets/validators.dart';
import 'package:wallpaper_app/helper/constants/app_colors.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photo_model.dart';
import 'package:wallpaper_app/view_models/home_view_model.dart';
import 'package:wallpaper_app/views/components/category_item.dart';
import 'components/photo_item.dart';

//TODO problem occured when open app without internet
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context,model,_)
      {
        model.getTheCategories();
//        model.getCuratedPhotos();
        return ResponsiveSensitive(
          mobileBody: MobileView(),
          desktopBody: WebView(),
        );
      },
      viewModelBuilder:()=>HomeViewModel(),
    );
  }
}


class MobileView extends HookViewModelWidget<HomeViewModel>{
  MobileView({Key? key}) : super(key: key, reactive: true);
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) {
    var _searchFocusNode=useFocusNode();
    var _searchTextEditingController=useTextEditingController();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: appBarTitle(context:context,isItGrid: model.isItGrid,onTap:()=> model.setViewStyle()),
        elevation: 0,
        backgroundColor: whiteColor ,
      ),
      body:
//      model.fetchingCuratedPhotos? Center(child: CircularProgressIndicator(),):
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextFormField(
                borderRadius: 20,
                validator: searchValidator,
                enabled: true,
                isSearch: true,
                counterTextShow: false,
                hint: "Search wallpaper",
                focusBorderColor: Theme.of(context).primaryColor,
                focusNode: _searchFocusNode,
                textInputAction: TextInputAction.done,
                controller:_searchTextEditingController,
                enterPressed: ()async{
                  if(_searchTextEditingController.text.trim().isEmpty){
                    _searchFocusNode.unfocus();
                  }else{
                    model.setSearch(_searchTextEditingController.text);
                    await model.getSearchPhotos();
                    _searchFocusNode.unfocus();
                  }
                },
               cursorColor:Theme.of(context).primaryColor ,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 70,
            child: ListItemsBuilder<CategoryModel>(
              verticalPadding: 0,
              items: model.categories,
              itemBuilder:(context,category)=>CategoryItem(
                title: category.categoryName,
                imageUrl: category.imageUrl,
                onTap: ()async{
                  model.setSearch(category.categoryName!);
                 await model.getSearchPhotos();
                },
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child:model.isBusy?Center(child:EmptyContent(justTitle: true,title: "Loading..",) ,):
            model.isItGrid?
            GridItemsBuilder<Photo>(
              emptyContentTitleTextColor: Theme.of(context).primaryColor,
              emptyContentSubTitleTextColor: Theme.of(context).accentColor,
              scrollDirection: Axis.vertical,
              items: model.photos,
              itemBuilder:(context,photo)=>PhotoItem(
                imageUrl: photo.src.portrait,
              ),
            )
            :ListItemsBuilder<Photo>(
              emptyContentTitleTextColor: Theme.of(context).primaryColor,
              emptyContentSubTitleTextColor: Theme.of(context).accentColor,
              scrollDirection: Axis.vertical,
              items: model.photos,
              itemBuilder:(context,photo)=>PhotoItem(
                imageUrl: photo.src.portrait,
              ),
            ),
          )
        ],
      ),
    );
  }
}


class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: appBarTitle(context: context,onTap:(){} ,isItGrid: true),
      ),
    );
  }
}


Widget appBarTitle({required BuildContext context,required void Function()? onTap,required bool isItGrid})=>Row(
//  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Expanded(
    child: Row(
      children: [
        Text("Wallpaper",style:Theme.of(context).textTheme.bodyText2),
        Text("House",style: Theme.of(context).textTheme.bodyText1),
      ],
    ),
  ),
    Align(
      alignment: Alignment.centerRight,
      child: InkWell(
          onTap: onTap,
          child: Icon(!isItGrid? Icons.grid_view:Icons.list_alt_outlined,color: Colors.grey,)),
    )
  ],);