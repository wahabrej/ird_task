import 'package:get/get.dart';
import 'package:ird_task/features/home/presentation/screen/home_screen.dart';
import 'package:ird_task/features/home/presentation/screen/card_detail_widget.dart';

class AppRoute {
  static String homeScreen = "/homeScreen";
  static String detailScreen = "/detailScreen";

  static String getHomeScreen() => homeScreen;
  static String getDetailScreen() => detailScreen;

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: detailScreen, page: () => DetailScreen()),
  ];
}
