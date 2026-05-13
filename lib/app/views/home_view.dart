import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/home_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/vin_input_card.dart';
import '../widgets/recent_search_card.dart';
import '../widgets/feature_card.dart';
import '../widgets/app_bottom_nav.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: const AlwaysStoppedAnimation(1.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildGreeting(),
                const SizedBox(height: 24),
                const VinInputCard(),
                const SizedBox(height: 24),
                _buildRecentSearches(),
                const SizedBox(height: 24),
                _buildFeatureCards(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(activeIndex: 0),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.royalBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            FontAwesomeIcons.carSide,
            color: Colors.white,
            size: 28,
          ),
        ),
        Text(
          'VinDecode',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.softBlue, width: 1),
          ),
          child: const Icon(
            FontAwesomeIcons.bell,
            color: AppColors.darkNavy,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good afternoon 👋',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'John Doe',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.darkNavy.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Searches',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.darkNavy,
              ),
            ),
            Text(
              'See All',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.royalBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dummyRecentSearches.length,
            separatorBuilder: (_, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final search = controller.dummyRecentSearches[index];
              return RecentSearchCard(
                title: search['title'] as String,
                year: search['year'] as String,
                vin: search['vin'] as String,
                time: search['time'] as String,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FeatureCard(
                icon: FontAwesomeIcons.hashtag,
                text: '17 Characters',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FeatureCard(
                icon: FontAwesomeIcons.globe,
                text: 'Global Database',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FeatureCard(
                icon: FontAwesomeIcons.bolt,
                text: 'Instant Results',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
