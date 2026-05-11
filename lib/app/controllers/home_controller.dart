import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HomeController extends GetxController {
  final vinController = TextEditingController();
  final currentIndex = 0.obs;
  final isButtonPressed = false.obs;

  final dummyRecentSearches = <Map<String, dynamic>>[
    {
      'title': 'BMW 3 Series',
      'year': '2013',
      'vin': 'WBA3A5G59DNP26...',
      'time': 'Just now',
    },
    {
      'title': 'Toyota Corolla',
      'year': '',
      'vin': '2T1BURHE0JC043...',
      'time': '3d ago',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    vinController.text = 'MHFK39BT8E2017270';
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void decodeVin() {
    isButtonPressed.value = true;
    Future.delayed(const Duration(milliseconds: 150), () {
      isButtonPressed.value = false;
      Get.snackbar(
        'VIN Decoded',
        'Processing: ${vinController.text}',
        backgroundColor: AppColors.royalBlue,
        colorText: AppColors.darkNavy,
        snackPosition: SnackPosition.TOP,
      );
    });
  }

  @override
  void onClose() {
    vinController.dispose();
    super.onClose();
  }
}