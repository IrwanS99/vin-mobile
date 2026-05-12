import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? rightText;
  final VoidCallback? onTap;
  final bool showChevron;
  final bool showSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final bool isDestructive;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.rightText,
    this.onTap,
    this.showChevron = true,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.darkNavy.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: isDestructive
                      ? AppColors.royalBlue
                      : AppColors.darkNavy.withValues(alpha: 0.45),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDestructive
                            ? AppColors.royalBlue
                            : AppColors.darkNavy,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkNavy.withValues(alpha: 0.45),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (rightText != null)
                Text(
                  rightText!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.royalBlue,
                  ),
                ),
              if (showSwitch)
                Transform.scale(
                  scale: 0.85,
                  child: Switch.adaptive(
                    value: switchValue,
                    onChanged: onSwitchChanged,
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.royalBlue.withValues(alpha: 0.3),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: AppColors.darkNavy.withValues(alpha: 0.2),
                  ),
                ),
              if (showChevron && !showSwitch && rightText == null)
                Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 14,
                  color: AppColors.darkNavy.withValues(alpha: 0.4),
                ),
            ],
          ),
        ),
      ),
    );
  }
}