import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdp_quiz/core/theme/icons.dart';
import 'package:pdp_quiz/core/theme/strings.dart';

import '../../core/theme/colors.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersPage(),
    );
  }
}



class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final ValueNotifier<bool> isCollapsedNotifier = ValueNotifier(false);


  @override
  void dispose() {
    isCollapsedNotifier.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280.0,
            floating: true,
            leadingWidth: 82,
            leading: Row(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: AppIcons.back
                ),
                Text(AppStrings.back,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: [
              Builder(
                builder: (context) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: isCollapsedNotifier,
                    builder: (context, isCollapsed, _) {
                      return isCollapsed
                          ? const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: FlutterLogo(size: 30),
                      )
                          : const SizedBox.shrink();
                    },
                  );
                },
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final isCollapsed = constraints.maxHeight <= kToolbarHeight + 10;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  isCollapsedNotifier.value = isCollapsed;
                });

                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: isCollapsed ? const Text("Flutter") : null,
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FlutterLogo(size: 150),
                      SizedBox(height: 8),
                      Text("Flutter", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('User $index'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('1200'),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: AppColors.green,
          unselectedItemColor: AppColors.black,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home.svg"), label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/grade.svg"), label: ''),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/profile.svg"), label: ''),
          ]),
    );
  }
}