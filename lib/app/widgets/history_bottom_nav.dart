import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/history_controller.dart';
import '../theme/app_colors.dart';

class HistoryBottomNav extends GetView<HistoryController> {
  const HistoryBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
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
                _buildNavItem(0, FontAwesomeIcons.qrcode, 'Decode'),
                _buildNavItem(1, FontAwesomeIcons.clockRotateLeft, 'History', isActive: true),
                _buildNavItem(2, FontAwesomeIcons.star, 'Favorites'),
                _buildNavItem(3, FontAwesomeIcons.user, 'Profile'),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, {bool isActive = false}) {
    final isCurrentActive = controller.currentIndex.value == index || isActive;

    return GestureDetector(
      onTap: () => controller.changePage(index),
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