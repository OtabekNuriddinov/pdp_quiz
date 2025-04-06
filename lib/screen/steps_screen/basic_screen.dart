import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'helpers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        title: Padding(
          padding: const EdgeInsets.all(8.0),

          ///#appBar
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Lorem ipsum dolor sit amet c...",
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                width: 17,
              ),
              Image.asset(
                "assets/icons/flutter.png",
                height: 55,
                width: 55,
              )
            ],
          ),
        ),
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
            GestureDetector(onTap: () {

            }, child: mainButtons("Easy")),
            SizedBox(
              height: 28,
            ),
            GestureDetector(onTap: () {

            }, child: mainButtons("Medium")),
            SizedBox(
              height: 28,
            ),
            GestureDetector(onTap: () {

            }, child: mainButtons("Hard")),
            SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/home.svg"), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/grade.svg"), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/profile.svg"), label: ''),
        ],
      ),
    );
  }
}
