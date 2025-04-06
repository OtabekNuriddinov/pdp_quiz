import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/dimens.dart';
import '../../core/theme/strings.dart';
import '../../core/theme/text_styles.dart';
import '../../core/widgets/custom_bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Text(
          AppStrings.greeting,
          style: AppTextStyles.appBarTitle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.appBarPadding),
            child: CircleAvatar(
              backgroundColor: AppColors.green,
              child: Image.asset('assets/icons/profile_person.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.gridPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimens.gridCrossAxisSpacing,
            mainAxisSpacing: AppDimens.gridMainAxisSpacing,
            childAspectRatio: AppDimens.gridChildAspectRatio,
          ),
          itemCount: AppStrings.techItems.length,
          itemBuilder: (context, index) {
            bool isPng = AppStrings.techItems[index]['icons']!.endsWith('.png');

            return Card(
              elevation: AppDimens.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isPng
                      ? Image.asset(
                    AppStrings.techItems[index]['icons']!,
                    height: AppDimens.gridIconSize,
                    width: AppDimens.gridIconSize,
                  )
                      : SvgPicture.asset(
                    AppStrings.techItems[index]['icons']!,
                    height: AppDimens.gridIconSize,
                    width: AppDimens.gridIconSize,
                  ),
                  SizedBox(height: AppDimens.gridTextSpacing),
                  Text(
                    AppStrings.techItems[index]['name']!,
                    style: AppTextStyles.techItemName,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}