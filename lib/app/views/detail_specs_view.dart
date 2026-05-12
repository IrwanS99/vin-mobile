import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/detail_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/detail_tab_bar.dart';
import '../widgets/detail_info_row.dart';
import '../widgets/detail_bottom_action.dart';

class DetailSpecsView extends StatefulWidget {
  const DetailSpecsView({super.key});

  @override
  State<DetailSpecsView> createState() => _DetailSpecsViewState();
}

class _DetailSpecsViewState extends State<DetailSpecsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;
  bool _rowsVisible = false;

  late DetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DetailController>();
    controller.selectedTab.value = 1;

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _rowsVisible = true);
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildVehicleIdentity(),
                const SizedBox(height: 28),
                Obx(
                  () => DetailTabBar(
                    tabs: controller.tabs,
                    selectedIndex: controller.selectedTab.value,
                    onTap: controller.changeTab,
                  ),
                ),
                const SizedBox(height: 32),
                Obx(() => _buildTabContent()),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
        bottomNavigationBar: DetailBottomAction(
          onSave: controller.onSave,
          onShare: controller.onShare,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () => Get.back(),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 44,
        height: 44,
        child: Align(
          alignment: Alignment.centerLeft,
          child: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.darkNavy,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleIdentity() {
    final data = controller.vehicleData.value;
    final vin = data?['vin'] as String? ?? 'WBA3A5G59DNP26082';
    final year = data?['year'] as String? ?? '2013';
    final make = data?['make'] as String? ?? 'BMW';
    final model = data?['model'] as String? ?? '3 Series';
    final country = data?['country'] as String? ?? 'Germany';
    final flag = data?['flag'] as String? ?? '🇩🇪';
    final vehicleType = data?['vehicleType'] as String? ?? 'Passenger Car';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vin,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.darkNavy.withValues(alpha: 0.5),
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$year $make',
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
            height: 1.1,
          ),
        ),
        Text(
          model,
          style: GoogleFonts.poppins(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: AppColors.royalBlue,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
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

  Widget _buildTabContent() {
    final tab = controller.selectedTab.value;
    if (tab == 1) return _buildSpecsContent();
    return _buildComingSoon(controller.tabs[tab]);
  }

  Widget _buildSpecsContent() {
    int globalIndex = 0;
    final sections = controller.specsSections;
    final List<Widget> children = [];

    for (int si = 0; si < sections.length; si++) {
      final section = sections[si];
      final title = section['title'] as String;
      final rows = section['rows'] as List<dynamic>;

      if (si > 0) children.add(const SizedBox(height: 36));

      // Section title
      final ti = globalIndex;
      children.add(
        AnimatedOpacity(
          opacity: _rowsVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 280 + (ti * 45)),
          child: AnimatedSlide(
            offset: _rowsVisible ? Offset.zero : const Offset(0, 0.06),
            duration: Duration(milliseconds: 280 + (ti * 45)),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.darkNavy,
              ),
            ),
          ),
        ),
      );
      children.add(const SizedBox(height: 4));
      globalIndex++;

      for (int ri = 0; ri < rows.length; ri++) {
        final row = rows[ri] as Map<dynamic, dynamic>;
        final idx = globalIndex;
        final isLast = ri == rows.length - 1;
        children.add(
          AnimatedOpacity(
            opacity: _rowsVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 280 + (idx * 45)),
            child: AnimatedSlide(
              offset: _rowsVisible ? Offset.zero : const Offset(0, 0.07),
              duration: Duration(milliseconds: 280 + (idx * 45)),
              child: DetailInfoRow(
                label: row['label'] as String,
                value: row['value'] as String,
                showDivider: !isLast,
              ),
            ),
          ),
        );
        globalIndex++;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildComingSoon(String tabName) {
    return SizedBox(
      height: 220,
      child: Center(
        child: Text(
          '$tabName — Coming soon',
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: AppColors.darkNavy.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
