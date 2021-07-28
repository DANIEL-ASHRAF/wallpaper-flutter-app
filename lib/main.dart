import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallpaper_app/services/app/app.locator.dart';
import 'package:wallpaper_app/services/app/app.router.dart';
import 'package:wallpaper_app/views/home_view.dart';

import 'helper/common_widgets/dialog/custom_dialog_ui.dart';
import 'helper/constants/app_colors.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupDialogUi();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: normalMode,
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}