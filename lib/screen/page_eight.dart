import 'dart:async';
import 'package:flutter/material.dart';

import '../core/theme/colors.dart';
import '../core/theme/icons.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: const Text("Title ham qoyinglar"),
          centerTitle: true,
          actions: [
            CircleAvatar(
              radius: 20,
              child: Center(
                  child: AppIcons.littleFlutter
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(alignment: Alignment.topCenter, child: TimerCard()),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 335,
              height: 202,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 3; i++)
                    CustomButton(
                        question: "$i savol",
                        variant: "${i + i} savollar boladi "),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: AppIcons.home, label: ''),
          BottomNavigationBarItem(icon: AppIcons.grade, label: ''),
          BottomNavigationBarItem(icon: AppIcons.profile, label: ''),
        ]),
      ),
    );
  }
}

class TimerCard extends StatefulWidget {
  const TimerCard({super.key});

  @override
  TimerCardState createState() => TimerCardState();
}

class TimerCardState extends State<TimerCard> {
  int _counter = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 280,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: -30,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// todo timer cicrle
              Container(
                padding: EdgeInsets.all(2),

                ///todo oq rangi
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green2,
                  ),
                ),
              ),

              /// todo timer
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String question;
  final String variant;

  const CustomButton(
      {super.key, required this.question, required this.variant});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          "$variant.  $question",
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
