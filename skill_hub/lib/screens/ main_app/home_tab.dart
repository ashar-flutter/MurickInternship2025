import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/featured_card.dart';
import '../../core/constants/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: AppColors.bannerGradient,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Murick Technologies',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore premium courses curated for industry',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(240, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromRGBO(255, 255, 255, 0.08),
                                const Color.fromRGBO(255, 255, 255, 0.04),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Join Now',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromRGBO(255, 255, 255, 0.06),
                                const Color.fromRGBO(255, 255, 255, 0.02),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Become Instructor',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Featured Courses',
              style: GoogleFonts.poppins(
                color: isDark ? Colors.white : Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            FeaturedCard(
              title: 'AI Foundations',
              subtitle: 'Intro to AI',
              rating: 4.8,
              gradient: AppColors.cardGradients[0],
            ),
            FeaturedCard(
              title: 'Machine Learning',
              subtitle: 'Supervised & Unsupervised',
              rating: 4.7,
              gradient: AppColors.cardGradients[1],
            ),
            FeaturedCard(
              title: 'Web Development',
              subtitle: 'Full Stack',
              rating: 4.6,
              gradient: AppColors.cardGradients[2],
            ),
            FeaturedCard(
              title: 'Cyber Security',
              subtitle: 'Defensive & Offensive',
              rating: 4.5,
              gradient: AppColors.cardGradients[3],
            ),
          ],
        ),
      ),
    );
  }
}
