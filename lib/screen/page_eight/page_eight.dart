
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/dimens.dart';
import '/screen/page_eight/page_eight_components/custom_button.dart';
import '/screen/page_eight/page_eight_components/timer_card.dart';
import '../../core/theme/icons.dart';
/// todo custom variant and question
List<String> variant=["A","B","C"]; ///variant name
List<String> answer=["Quisque sit","Lorem ipsum","Phasellus auctor"]; ///answer
List<String> question=["Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quesqie sit amet welit malesuada ,sceleresque diam non ,blandit neque. "];
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
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(alignment: Alignment.topCenter, child: TimerCard(question: question.first,)),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 335,
              height: 202,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i=0;i< answer.length;i++)
                  CustomButton(
                        variant: variant[i],
                    question: answer[i],
                  ),

                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: AppColors.green,
            unselectedItemColor: AppColors.black,
            items: [

          BottomNavigationBarItem(icon: AppIcons.home, label: ''),
          BottomNavigationBarItem(icon: AppIcons.center, label: ''),
          BottomNavigationBarItem(icon: AppIcons.person, label: ''),
        ]),
      ),
    );
  }
/// todo appBar
  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("Lorem ipsum dolor sit amet...",style: TextStyle(fontFamily: "Poppins"),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              radius: 20,
              child: Center(
                  child: AppIcons.littleFlutter
              ),
            ),
          )
        ],
      );
  }
}



