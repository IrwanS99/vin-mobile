import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/history_controller.dart';
import '../theme/app_colors.dart';

class ClearAllButton extends StatelessWidget {
  const ClearAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HistoryController>()) {
      return const SizedBox.shrink();
    }

    return GetBuilder<HistoryController>(
      init: Get.find<HistoryController>(),
      builder: (controller) {
        return Obx(() {
          final isEmpty = controller.historyList.isEmpty;

          return AnimatedOpacity(
            opacity: isEmpty ? 0.5 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: isEmpty ? null : () => controller.clearAll(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 118,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.royalBlue,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.royalBlue.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Clear All',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
