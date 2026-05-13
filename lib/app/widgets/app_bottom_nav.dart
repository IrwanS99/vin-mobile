import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_colors.dart';
import '../routes/app_routes.dart';

class AppBottomNav extends StatelessWidget {
  final int activeIndex;

  const AppBottomNav({super.key, required this.activeIndex});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, FontAwesomeIcons.house, 'Home'),
              _buildNavItem(1, FontAwesomeIcons.clockRotateLeft, 'History'),
              _buildNavItem(2, FontAwesomeIcons.heart, 'Favorites'),
              _buildNavItem(3, FontAwesomeIcons.user, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = activeIndex == index;

    return GestureDetector(
      onTap: () {
        if (isActive) return;
        if (index == 0) {
          Get.offAllNamed(AppRoutes.home);
        } else if (index == 1) {
          Get.offNamed(AppRoutes.history);
        } else if (index == 2) {
          Get.offNamed(AppRoutes.favorites);
        } else if (index == 3) {
          Get.offNamed(AppRoutes.profile);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 20 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.softBlue.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? AppColors.royalBlue
                  : AppColors.darkNavy.withValues(alpha: 0.4),
              size: 20,
            ),
            if (isActive) ...[
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
