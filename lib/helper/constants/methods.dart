import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallpaper_app/helper/common_widgets/dialog/dialog_type.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';

//for Dialog
final _dialogService= locator<DialogService>();

Future showErrorDialog(String? message)async{
  await _dialogService.showCustomDialog(
    title: "Error",
    description:message??"something wrong!!" ,
    mainButtonTitle: "ok",
    variant:DialogType.Basic ,
  );
}

Future showLoadingDialog()async{
  await _dialogService.showCustomDialog(
    variant:DialogType.Loading ,
  );
}

//for navigation
NavigationService _navigationService=locator<NavigationService>();

//navigation without animation
Future navigateWithoutAnimation(Widget widget)async{
  await _navigationService.navigateWithTransition(widget,transition:"",duration: Duration(seconds: 0));
}

Future navigateAndRemoveUntil(String routeName)async{
  print("Hey >>>>>>>>");
  await _navigationService.pushNamedAndRemoveUntil(routeName,predicate:(Route<dynamic> route) => false);
}
