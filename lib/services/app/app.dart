import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallpaper_app/views/home_view.dart';
import 'package:wallpaper_app/views/image_view.dart';

import '../api.dart';
import '../api_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: ImageView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: API),
    LazySingleton(classType: APIService)
  ]
)
class AppSetup {}