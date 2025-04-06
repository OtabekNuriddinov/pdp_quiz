import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz/core/theme/icons.dart';

class FlutterAppBar extends StatelessWidget {
  final VoidCallback onBackPressed;

  const FlutterAppBar({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final collapsed = constraints.maxHeight <= kToolbarHeight + 40;
          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 12),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!collapsed)
                  const SizedBox(width: 40)
                else
                  const SizedBox.shrink(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!collapsed)
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: AppIcons.littleFlutter,
                        ),
                      if (!collapsed) const SizedBox(height: 2),
                      Text(
                        'Flutter',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                collapsed
                    ? const FlutterLogo(size: 20)
                    : const SizedBox(width: 40),
              ],
            ),
          );
        },
      ),
      leading: GestureDetector(
        onTap: onBackPressed,
        child: const Align(
          alignment: Alignment(1, 0.8),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.arrow_back_rounded),
              Text(
                "Back",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      leadingWidth: 90,
    );
  }
}