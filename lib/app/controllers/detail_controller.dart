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
    {
      'icon': FontAwesomeIcons.leftRight,
      'label': 'Transmission',
      'value': 'CVT',
    },
    {'icon': FontAwesomeIcons.doorOpen, 'label': 'Doors', 'value': '4'},
    {'icon': FontAwesomeIcons.chair, 'label': 'Seats', 'value': '5'},
    {
      'icon': FontAwesomeIcons.palette,
      'label': 'Color',
      'value': 'Lunar Silver Metallic',
    },
    {
      'icon': FontAwesomeIcons.shapes,
      'label': 'Vehicle Type',
      'value': 'Passenger Car',
    },
  ];

  final List<Map<String, dynamic>> specsSections = [
    {
      'title': 'Engine',
      'rows': [
        {'label': 'Engine', 'value': '2.0L 4-Cylinder TwinPower Turbo'},
        {'label': 'Horsepower', 'value': '240 HP'},
        {'label': 'Cylinders', 'value': '4'},
      ],
    },
    {
      'title': 'Dimensions',
      'rows': [
        {'label': 'Doors', 'value': '4'},
        {'label': 'Seats', 'value': '5'},
        {'label': 'Body Class', 'value': 'Sedan'},
      ],
    },
    {
      'title': 'Drivetrain',
      'rows': [
        {'label': 'Transmission', 'value': 'Automatic'},
        {'label': 'Drive Type', 'value': 'RWD'},
        {'label': 'Fuel Type', 'value': 'Petrol'},
      ],
    },
    {
      'title': 'Identity',
      'rows': [
        {'label': 'Make', 'value': 'BMW'},
        {'label': 'Model', 'value': '3 Series'},
        {'label': 'Year', 'value': '2013'},
        {'label': 'Manufacturer', 'value': 'Bayerische Motoren Werke AG'},
        {'label': 'Plant City', 'value': 'Munich, Germany'},
      ],
    },
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
