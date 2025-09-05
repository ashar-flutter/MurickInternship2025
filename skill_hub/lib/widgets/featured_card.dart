import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_colors.dart';

class FeaturedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double rating;
  final Gradient? gradient;

  const FeaturedCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    this.gradient,
  });

  IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'ai':
        return Iconsax.cpu;
      case 'machine learning':
      case 'ml':
        return Iconsax.activity;
      case 'web development':
      case 'web app':
        return Iconsax.global;
      case 'cyber security':
        return Iconsax.shield;
      case 'data science':
        return Iconsax.chart;
      case 'cloud':
        return Iconsax.cloud;
      case 'app dev':
        return Iconsax.mobile;
      default:
        return Iconsax.book;
    }
  }

  @override
  Widget build(BuildContext context) {
    final g =
        gradient ??
        AppColors.cardGradients[title.hashCode %
            AppColors.cardGradients.length];
    final icon = getCategoryIcon(title);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: g,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    color: Colors.white.withValues(alpha: 0.95),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Iconsax.star1, color: Colors.yellow[600], size: 16),
                    const SizedBox(width: 6),
                    Text(
                      rating.toStringAsFixed(1),
                      style: GoogleFonts.poppins(
                        color: Colors.white.withValues(alpha: 0.95),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
