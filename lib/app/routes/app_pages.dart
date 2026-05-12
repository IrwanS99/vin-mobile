import 'package:get/get.dart';
import 'app_routes.dart';
import '../views/home_view.dart';
import '../views/history_view.dart';
import '../bindings/home_binding.dart';
import '../bindings/history_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}