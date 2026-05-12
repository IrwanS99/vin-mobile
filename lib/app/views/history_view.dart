import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/history_controller.dart';
import '../controllers/home_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/history_card.dart';
import '../widgets/clear_all_button.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Expanded(
                      child: _buildHistoryList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          ClearAllButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Search History',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    return Obx(() {
      if (controller.historyList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.clockRotateLeft,
                size: 48,
                color: AppColors.darkNavy.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'No search history yet',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkNavy.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your VIN searches will appear here',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkNavy.withValues(alpha: 0.4),
                ),
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemCount: controller.historyList.length,
        separatorBuilder: (_, index) => const SizedBox(height: 18),
        itemBuilder: (context, index) {
          final item = controller.historyList[index];
          return HistoryCard(
            title: item['title'] as String,
            vin: item['vin'] as String,
            year: item['year'] as String,
            time: item['time'] as String,
            onTap: () => controller.onTapHistoryItem(index),
          );
        },
      );
    });
  }

  Widget _buildBottomNav() {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (homeController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: AppColors.softBlue.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkNavy.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, FontAwesomeIcons.qrcode, 'Decode', homeController),
                    _buildNavItem(1, FontAwesomeIcons.clockRotateLeft, 'History', homeController, isActive: true),
                    _buildNavItem(2, FontAwesomeIcons.star, 'Favorites', homeController),
                    _buildNavItem(3, FontAwesomeIcons.user, 'Profile', homeController),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, HomeController homeController, {bool isActive = false}) {
    final isCurrentActive = homeController.currentIndex.value == index || isActive;

    return GestureDetector(
      onTap: () {
        homeController.changePage(index);
        if (index == 0) {
          Get.back();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isCurrentActive ? 20 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isCurrentActive ? AppColors.softBlue.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isCurrentActive ? AppColors.royalBlue : AppColors.darkNavy.withValues(alpha: 0.4),
              size: 20,
            ),
            if (isCurrentActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.royalBlue,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}