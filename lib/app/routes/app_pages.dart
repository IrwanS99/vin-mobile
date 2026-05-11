import 'package:get/get.dart';
import 'app_routes.dart';
import '../views/home_view.dart';
import '../bindings/home_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}