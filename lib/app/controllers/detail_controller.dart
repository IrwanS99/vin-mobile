import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailController extends GetxController {
  final selectedTab = 0.obs;
  final vehicleData = Rxn<Map<String, dynamic>>();

  final List<String> tabs = ['Overview', 'Specs', 'Equipment', 'Safety'];

  final List<Map<String, dynamic>> specs = [
    {'icon': FontAwesomeIcons.car, 'label': 'Body Type', 'value': 'Sedan'},
    {'icon': FontAwesomeIcons.gasPump, 'label': 'Fuel Type', 'value': 'Petrol'},
    {'icon': FontAwesomeIcons.gears, 'label': 'Drive Type', 'value': 'FWD'},
    {'icon': FontAwesomeIcons.leftRight, 'label': 'Transmission', 'value': 'CVT'},
    {'icon': FontAwesomeIcons.doorOpen, 'label': 'Doors', 'value': '4'},
    {'icon': FontAwesomeIcons.chair, 'label': 'Seats', 'value': '5'},
    {'icon': FontAwesomeIcons.palette, 'label': 'Color', 'value': 'Lunar Silver Metallic'},
    {'icon': FontAwesomeIcons.shapes, 'label': 'Vehicle Type', 'value': 'Passenger Car'},
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void onSave() {
    Get.snackbar(
      'Success',
      'Vehicle saved successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1E88FF),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void onShare() {
    Get.snackbar(
      'Share',
      'Share vehicle detail',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1E88FF),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      vehicleData.value = Get.arguments as Map<String, dynamic>;
    }
  }
}