import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/profile_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/profile_section_card.dart';
import '../widgets/app_bottom_nav.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: const AlwaysStoppedAnimation(1.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                _buildProfileHeader(),
                const SizedBox(height: 24),
                _buildEditProfileButton(),
                const SizedBox(height: 40),
                _buildAccountSection(),
                const SizedBox(height: 40),
                _buildPreferencesSection(),
                const SizedBox(height: 40),
                _buildSubscriptionSection(),
                const SizedBox(height: 40),
                _buildAboutSection(),
                const SizedBox(height: 40),
                _buildDangerZoneSection(),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: AppColors.royalBlue,
            borderRadius: BorderRadius.circular(64),
          ),
          child: Center(
            child: Text(
              'JD',
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'John Doe',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'john@example.com',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.darkNavy.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.softBlue.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            'STANDARD PLAN',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.darkNavy.withValues(alpha: 0.6),
              letterSpacing: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return Container(
      height: 58,
      width: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.softBlue.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkNavy.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: controller.onEditProfile,
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: Text(
              'Edit Profile',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.darkNavy,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.darkNavy.withValues(alpha: 0.45),
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider({double opacity = 0.15}) {
    return Divider(
      height: 1,
      thickness: 1,
      color: AppColors.softBlue.withValues(alpha: opacity),
    );
  }

  Widget _buildAccountSection() {
    return Column(
      children: [
        _buildSectionTitle('ACCOUNT'),
        ProfileSectionCard(
          children: [
            ProfileMenuItem(
              icon: FontAwesomeIcons.user,
              title: 'Edit Profile',
              onTap: controller.onEditProfile,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.lock,
              title: 'Change Password',
              onTap: controller.onChangePassword,
            ),
            _buildDivider(),
            Obx(() => ProfileMenuItem(
              icon: FontAwesomeIcons.bell,
              title: 'Notifications',
              showChevron: false,
              showSwitch: true,
              switchValue: controller.notificationsEnabled.value,
              onSwitchChanged: controller.toggleNotifications,
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      children: [
        _buildSectionTitle('PREFERENCES'),
        ProfileSectionCard(
          children: [
            ProfileMenuItem(
              icon: FontAwesomeIcons.ruler,
              title: 'Unit System',
              subtitle: controller.selectedUnit.value,
              onTap: controller.onUnitSystem,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.globe,
              title: 'Language',
              subtitle: controller.selectedLanguage.value,
              onTap: controller.onLanguage,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubscriptionSection() {
    return Column(
      children: [
        _buildSectionTitle('SUBSCRIPTION'),
        ProfileSectionCard(
          children: [
            ProfileMenuItem(
              icon: FontAwesomeIcons.award,
              title: 'Current Plan',
              rightText: controller.currentPlan.value,
              showChevron: false,
              onTap: controller.onCurrentPlan,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.receipt,
              title: 'Billing History',
              onTap: controller.onBillingHistory,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return Column(
      children: [
        _buildSectionTitle('ABOUT'),
        ProfileSectionCard(
          children: [
            ProfileMenuItem(
              icon: FontAwesomeIcons.circleInfo,
              title: 'App Version',
              rightText: '1.0.0',
              showChevron: false,
              onTap: controller.onAppVersion,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.shieldHalved,
              title: 'Privacy Policy',
              onTap: controller.onPrivacyPolicy,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.fileLines,
              title: 'Terms of Service',
              onTap: controller.onTermsOfService,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.star,
              title: 'Rate the App',
              onTap: controller.onRateApp,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.headset,
              title: 'Contact Support',
              onTap: controller.onContactSupport,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDangerZoneSection() {
    return Column(
      children: [
        _buildSectionTitle('DANGER ZONE'),
        ProfileSectionCard(
          children: [
            ProfileMenuItem(
              icon: FontAwesomeIcons.rightFromBracket,
              title: 'Sign Out',
              isDestructive: true,
              onTap: controller.onSignOut,
            ),
            _buildDivider(),
            ProfileMenuItem(
              icon: FontAwesomeIcons.trashCan,
              title: 'Delete Account',
              isDestructive: true,
              onTap: controller.onDeleteAccount,
            ),
          ],
        ),
      ],
    );
  }
}