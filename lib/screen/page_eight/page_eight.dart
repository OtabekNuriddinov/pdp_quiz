
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import '/screen/page_eight/page_eight_components/custom_button.dart';
import '/screen/page_eight/page_eight_components/timer_card.dart';
import '../../core/theme/icons.dart';
/// todo custom variant and question
List<String> variant=["A","B","C"]; ///variant name
List<String> answer=["Quisque sit","Lorem ipsum","Phasellus auctor"]; ///vari
List<String> question=[
  " 1 - Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quesqie sit amet welit malesuada ,sceleresque diam non ,blandit neque. ",
  " 2 - Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quesqie sit amet welit malesuada ,sceleresque diam non ,blandit neque. ",
  " 3 - Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quesqie sit amet welit malesuada ,sceleresque diam non ,blandit neque. ",
  " 4 - Lorem ipsum dolor sit amet, consectetur adipiscing elit.Quesqie sit amet welit malesuada ,sceleresque diam non ,blandit neque. ",
];
void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
int count=0;

class _MyAppState extends State<MyApp> {
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
            Align(alignment: Alignment.topCenter, child: TimerCard(question: question[count],)),/// countt listni elementini bilidradi
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
                    onPressed: () {
                          setState(() {
                            count+=1;
                          //  if(count==question.length) todo next page ga o'tishis kerak va  correct va  incorrect natijani  berishim kerak page ga
                          });
                    },
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
          BottomNavigationBarItem(icon: AppIcons.grade, label: ''),
          BottomNavigationBarItem(icon: AppIcons.profile, label: ''),
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



