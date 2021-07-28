// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../views/home_view.dart';
import '../../views/image_view.dart';

class Routes {
  static const String homeView = '/';
  static const String imageView = '/image-view';
  static const all = <String>{
    homeView,
    imageView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.imageView, page: ImageView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ImageView: (data) {
      var args = data.getArgs<ImageViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ImageView(
          key: args.key,
          imageUrl: args.imageUrl,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ImageView arguments holder class
class ImageViewArguments {
  final Key? key;
  final String imageUrl;
  ImageViewArguments({this.key, required this.imageUrl});
}
