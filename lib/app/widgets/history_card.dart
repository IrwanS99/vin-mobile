import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_colors.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String vin;
  final String year;
  final String time;
  final String? imagePath;
  final VoidCallback onTap;

  const HistoryCard({
    super.key,
    required this.title,
    required this.vin,
    required this.year,
    required this.time,
    this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.softBlue.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkNavy.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 16),
            Expanded(child: _buildInfo()),
            _buildRightSide(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.softBlue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        FontAwesomeIcons.carSide,
        color: AppColors.royalBlue,
        size: 24,
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.darkNavy,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          vin,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.darkNavy.withValues(alpha: 0.5),
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (year.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.softBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              year,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.royalBlue,
              ),
            ),
          ),
        const SizedBox(height: 8),
        Text(
          time,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.darkNavy.withValues(alpha: 0.45),
          ),
        ),
        const SizedBox(height: 6),
        Icon(
          FontAwesomeIcons.chevronRight,
          color: AppColors.darkNavy.withValues(alpha: 0.4),
          size: 14,
        ),
      ],
    );
  }
}