
import 'package:flutter/material.dart';

import '../../core/theme/icons.dart';
import 'components/custom_button.dart';
import 'components/timer_card.dart';


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



