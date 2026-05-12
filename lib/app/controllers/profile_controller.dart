import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxBool notificationsEnabled = true.obs;
  final RxString selectedUnit = 'Metric'.obs;
  final RxString selectedLanguage = 'English'.obs;
  final RxString currentPlan = 'Standard'.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }

  void onEditProfile() {
    Get.snackbar(
      'Edit Profile',
      'Edit profile tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onChangePassword() {
    Get.snackbar(
      'Change Password',
      'Change password tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onUnitSystem() {
    Get.snackbar(
      'Unit System',
      'Unit system tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onLanguage() {
    Get.snackbar(
      'Language',
      'Language tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onCurrentPlan() {
    Get.snackbar(
      'Current Plan',
      'Current plan tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onBillingHistory() {
    Get.snackbar(
      'Billing History',
      'Billing history tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onAppVersion() {
    Get.snackbar(
      'App Version',
      'App version: 1.0.0',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onPrivacyPolicy() {
    Get.snackbar(
      'Privacy Policy',
      'Privacy policy tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onTermsOfService() {
    Get.snackbar(
      'Terms of Service',
      'Terms of service tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onRateApp() {
    Get.snackbar(
      'Rate the App',
      'Rate the app tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onContactSupport() {
    Get.snackbar(
      'Contact Support',
      'Contact support tapped',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.colorScheme.surface,
      colorText: Get.theme.colorScheme.onSurface,
    );
  }

  void onSignOut() {
    Get.defaultDialog(
      title: 'Sign Out',
      middleText: 'Are you sure you want to sign out?',
      textConfirm: 'Sign Out',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
        Get.snackbar(
          'Signed Out',
          'You have been signed out',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  void onDeleteAccount() {
    Get.defaultDialog(
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account? This action cannot be undone.',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: Colors.redAccent,
      onConfirm: () {
        Get.back();
        Get.snackbar(
          'Account Deleted',
          'Your account has been deleted',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }
}