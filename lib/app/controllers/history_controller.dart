import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../routes/app_routes.dart';

class HistoryController extends GetxController {
  final currentIndex = 1.obs;
  final isButtonPressed = false.obs;

  final historyList = <Map<String, dynamic>>[
    {
      'title': 'BMW 3 Series',
      'vin': 'WBA3A5G59DNP26082',
      'year': '2013',
      'time': '18m ago',
      'icon': 'car',
    },
    {
      'title': 'Toyota Corolla',
      'vin': '2T1BURHE0JC043821',
      'year': '2018',
      'time': '3d ago',
      'icon': 'car',
    },
    {
      'title': 'Honda Civic Sedan',
      'vin': '1HGBH41JXMN109186',
      'year': '2021',
      'time': '3d ago',
      'icon': 'car',
    },
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void clearAll() {
    isButtonPressed.value = true;
    Future.delayed(const Duration(milliseconds: 150), () {
      isButtonPressed.value = false;
      historyList.clear();
      Get.snackbar(
        'History cleared successfully',
        'All search history has been removed',
        backgroundColor: AppColors.royalBlue,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    });
  }

  void onTapHistoryItem(int index) {
    final item = historyList[index];
    Get.toNamed(
      AppRoutes.detail,
      arguments: {
        'title': item['title'],
        'vin': item['vin'],
        'year': item['year'],
        'country': 'United States',
        'vehicleType': 'Passenger Car',
      },
    );
  }
}