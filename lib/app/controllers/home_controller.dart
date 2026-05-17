import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final vinController = TextEditingController();
  final currentIndex = 0.obs;
  final isButtonPressed = false.obs;
  final vinLength = 0.obs;

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

  final carDataList = [
    {
      'title': 'BMW 3 Series',
      'vin': 'WBA3A5G59DNP26082',
      'year': '2013',
      'country': 'United States',
      'vehicleType': 'Passenger Car',
      'image': 'assets/bmw.png',
    },
    {
      'title': 'Toyota Corolla',
      'vin': '2T1BURHE0JC043821',
      'year': '2018',
      'country': 'United States',
      'vehicleType': 'Passenger Car',
      'image': 'assets/corolla.png',
    },
    {
      'title': 'Honda Civic Sedan',
      'vin': '1HGBH41JXMN109186',
      'year': '2021',
      'country': 'United States',
      'vehicleType': 'Passenger Car',
      'image': 'assets/civic.png',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    vinController.text = 'MHFK39BT8E2017270';
    vinLength.value = vinController.text.length;
    vinController.addListener(() {
      vinLength.value = vinController.text.length;
    });
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  void decodeVin() {
    isButtonPressed.value = true;
    Future.delayed(const Duration(milliseconds: 150), () {
      isButtonPressed.value = false;

      final randomCar = carDataList[DateTime.now().millisecond % 3];

      Get.toNamed(
        AppRoutes.detail,
        arguments: randomCar,
      );
    });
  }

  @override
  void onClose() {
    vinController.dispose();
    super.onClose();
  }
}