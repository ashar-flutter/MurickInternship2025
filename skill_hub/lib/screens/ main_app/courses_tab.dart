import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CoursesTab extends StatelessWidget {
  const CoursesTab({super.key});

  final List<Map<String, dynamic>> courses = const [
    {'title': 'Artificial Intelligence', 'icon': Iconsax.cpu},
    {'title': 'Cyber Security', 'icon': Iconsax.shield_tick},
    {'title': 'Data Science', 'icon': Iconsax.graph},
    {'title': 'C++ Programming', 'icon': Iconsax.code},
    {'title': 'Web Development', 'icon': Iconsax.global},
    {'title': 'Flutter', 'icon': Iconsax.mobile},
    {'title': 'Cloud Computing', 'icon': Iconsax.cloud},
    {'title': 'Machine Learning', 'icon': Iconsax.hierarchy},
    {'title': 'Blockchain', 'icon': Iconsax.bitcoin_convert},
    {'title': 'Game Development', 'icon': Iconsax.game},
  ];

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: isLight ? Colors.white : Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Courses',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: isLight ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, i) {
          final c = courses[i];
          return Card(
            color: isLight ? Colors.white : Colors.grey[900],
            elevation: 10,
            shadowColor: isLight
                ? Colors.grey.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: Icon(c['icon'], color: Colors.blueAccent, size: 28),
              title: Text(
                c['title'],
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: isLight ? Colors.black87 : Colors.white,
                ),
              ),
              trailing: const Icon(Iconsax.arrow_right_3, size: 22),
            ),
          );
        },
      ),
    );
  }
}
