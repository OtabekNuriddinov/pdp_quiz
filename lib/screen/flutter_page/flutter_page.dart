import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/icons.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page_component/appbar.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page_component/row_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterPage(),
    );
  }
}

class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  var activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: customAppBar(context),
        body: DefaultTextStyle(
          style: GoogleFonts.poppins(),
          child: Container(
            padding: EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 12,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              activeIndex = i;
                              setState(() {});
                            },
                            child: CustomRowItem(
                              isActive: activeIndex == i,
                              text: "$i-modul",
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  for(int i = 1 ; i < 8 ; i ++)
                    Container(
                      alignment: Alignment.center,
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.grey50,
                      ),
                      child: ListTile(
                        title: Text(
                          "$i.Lorem Ipsum dolor sit amet",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Icon(Icons.add),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
