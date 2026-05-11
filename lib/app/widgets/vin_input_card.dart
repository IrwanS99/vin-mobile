import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/home_controller.dart';
import '../theme/app_colors.dart';

class VinInputCard extends GetView<HomeController> {
  const VinInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.darkNavy,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.softBlue,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter Vehicle VIN',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.softBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Enter a 17-character Vehicle Identification Number',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.softBlue.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkNavy,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.softBlue,
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller.vinController,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.softBlue,
                letterSpacing: 2,
              ),
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: 'Enter VIN...',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.softBlue.withValues(alpha: 0.5),
                  letterSpacing: 2,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.check,
                      color: AppColors.softBlue,
                      size: 16,
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      FontAwesomeIcons.camera,
                      color: AppColors.softBlue,
                      size: 16,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(() {
              final length = controller.vinController.text.length;
              return Text(
                '$length / 17',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: length == 17
                      ? AppColors.royalBlue
                      : AppColors.softBlue.withValues(alpha: 0.7),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Obx(() {
            return GestureDetector(
              onTap: controller.decodeVin,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: controller.isButtonPressed.value
                      ? AppColors.softBlue
                      : AppColors.royalBlue,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    'Decode VIN',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkNavy,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}