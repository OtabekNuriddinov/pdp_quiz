import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/icons.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';
import '../../core/widgets/main_elevated_button.dart';
import 'helpers.dart';

void main() {
  runApp(LevelScreen());
}

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text("Lorem ipsum dolor ", style: TextStyle(fontSize: 20)),
        actions: [
          SizedBox(
            height: 20,
            width: 20,
            child: AppIcons.littleFlutter,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),

      ///#body
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///#container Welcome to I.Q
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
              child: Container(
                height: 162,
                width: MediaQuery.of(context).size.width - 32.0,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 181, 51),
                    borderRadius: BorderRadius.all(Radius.circular(15))),

                ///#texts in container
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: text("Welcome to I.Q", 18, FontWeight.w600,
                              Colors.white)),
                      SizedBox(
                        height: 7,
                      ),
                      text("Lorem ipsum dolor sit amet,", 15, FontWeight.w500,
                          Colors.white),
                      text("consectetur adipiscing elit. Quisque", 15,
                          FontWeight.w500, Colors.white),
                      text("sit amet velit malesuada,scelerisque", 15,
                          FontWeight.w500, Colors.white),
                      text("diam non ,blandit neque.", 15, FontWeight.w500,
                          Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            ///# text
            text("Choose one of the", 25, FontWeight.w600, Colors.black),
            text("steps...", 25, FontWeight.w600, Colors.black),
            SizedBox(
              height: 32,
            ),

            ///#main buttons
            SizedBox(
              height: 60,
              width: 280,
              child: MainElevatedButton(
                text: "Easy",
                onTapped: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.eight,
                  );
                },
              ),
            ),
            SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 60,
              width: 280,
              child: MainElevatedButton(
                text: "Medium",
                onTapped: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.eight,
                  );
                },
              ),
            ),
            SizedBox(
              height: 28,
            ),
            SizedBox(
              height: 60,
              width: 280,
              child: MainElevatedButton(
                text: "Hard",
                onTapped: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.eight,
                  );
                },
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(0, context),
    );
  }
}
