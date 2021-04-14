import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:wallpaper_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:wallpaper_app/helper/common_widgets/list_items_builder.dart';
import 'package:wallpaper_app/helper/common_widgets/responsive_sensitive.dart';
import 'package:wallpaper_app/helper/common_widgets/validators.dart';
import 'package:wallpaper_app/helper/constants/app_colors.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/view_models/home_view_model.dart';
import 'package:wallpaper_app/views/components/category_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context,model,_)
      {
        model.getTheCategories();
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
  MobileView({Key? key}) : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) {
    var _searchFocusNode=useFocusNode();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: appBarTitle(context),
        elevation: 0,
        backgroundColor: whiteColor ,
      ),
      body: Column(
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
                enterPressed: (){
                    _searchFocusNode.unfocus();
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
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridItemsBuilder<CategoryModel>(
              scrollDirection: Axis.vertical,
              items: model.categories,
              itemBuilder:(context,category)=>PhotoItem(
                imageUrl: category.imageUrl,
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
        title: appBarTitle(context),
      ),
    );
  }
}

Widget appBarTitle(BuildContext context)=>Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text("Wallpaper",style:Theme.of(context).textTheme.bodyText2),
  Text("Hub",style: Theme.of(context).textTheme.bodyText1)
],);