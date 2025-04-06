import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page_component/row_item.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page_component/vertical_item.dart';

import 'flutter_page_component/appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlutterPage(),
    );
  }
}

class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            FlutterAppBar(
              onBackPressed: () {
                Navigator.pop(context);
              },
            ),
            SliverToBoxAdapter(
              child: DefaultTextStyle(
                style: GoogleFonts.poppins(),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModuleSelector(
                        activeIndex: activeIndex,
                        onModuleSelected: (index) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      LessonsList(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(0, context),
      ),
    );
  }
}




