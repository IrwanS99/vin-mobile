import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/detail_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/vehicle_info_card.dart';
import '../widgets/vehicle_spec_card.dart';
import '../widgets/detail_bottom_action.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              GetBuilder<DetailController>(
                init: controller,
                builder: (_) => _buildVehicleTitle(),
              ),
              const SizedBox(height: 24),
              GetBuilder<DetailController>(
                init: controller,
                builder: (_) => _buildTabNavigation(),
              ),
              const SizedBox(height: 24),
              GetBuilder<DetailController>(
                init: controller,
                builder: (_) => _buildVehicleHeroCard(),
              ),
              const SizedBox(height: 24),
              _buildSpecsGrid(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DetailBottomAction(
        onSave: controller.onSave,
        onShare: controller.onShare,
      ),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(
          FontAwesomeIcons.arrowLeft,
          color: AppColors.darkNavy,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildVehicleTitle() {
    final data = controller.vehicleData.value;
    final title = data?['title'] ?? 'Unknown';
    final year = data?['year'] ?? '';
    final vin = data?['vin'] ?? '';
    final country = data?['country'] ?? 'United States';
    final vehicleType = data?['vehicleType'] ?? 'Passenger Car';

    final titleParts = title.split(' ');
    final yearText = year.isNotEmpty
        ? '$year ${titleParts.take(titleParts.length > 1 ? 1 : 0).join(' ')}'
        : title;
    final modelText = titleParts.length > 1
        ? titleParts.skip(1).join(' ')
        : title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vin,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.darkNavy.withValues(alpha: 0.5),
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          yearText,
          style: GoogleFonts.poppins(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
        Text(
          modelText,
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.royalBlue,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text('🇺🇸', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              country,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.darkNavy.withValues(alpha: 0.55),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.softBlue.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                vehicleType,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.royalBlue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabNavigation() {
    final selectedIndex = controller.selectedTab.value;

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: controller.tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final label = entry.value;
              final isActive = selectedIndex == index;

              return GestureDetector(
                onTap: () => controller.changeTab(index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isActive
                              ? AppColors.royalBlue
                              : AppColors.darkNavy.withValues(alpha: 0.4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: label.length * 9.0,
                        height: 4,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.softBlue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 12),
        Divider(color: AppColors.softBlue.withValues(alpha: 0.3), thickness: 1),
      ],
    );
  }

  Widget _buildVehicleHeroCard() {
    final data = controller.vehicleData.value;
    final title = data?['title'] ?? 'Unknown Vehicle';
    final year = data?['year'] ?? '';
    final imagePath = data?['image'] as String?;

    final displayTitle = year.isNotEmpty ? '$year $title' : title;

    return VehicleInfoCard(title: displayTitle, imagePath: imagePath);
  }

  Widget _buildSpecsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 1.2,
      ),
      itemCount: controller.specs.length,
      itemBuilder: (context, index) {
        final spec = controller.specs[index];
        return VehicleSpecCard(
          icon: spec['icon'] as IconData,
          label: spec['label'] as String,
          value: spec['value'] as String,
        );
      },
    );
  }
}
