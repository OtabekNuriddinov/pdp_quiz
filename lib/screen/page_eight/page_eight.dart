import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/config/routes.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';
import 'package:pdp_quiz/screen/result_page/result_screen.dart';
import 'package:pdp_quiz/screen/users/users_page.dart';
import '/screen/page_eight/page_eight_components/custom_button.dart';
import '/screen/page_eight/page_eight_components/timer_card.dart';
import '../../core/theme/icons.dart';

class EightPage extends StatefulWidget {
  const EightPage({super.key});

  @override
  State<EightPage> createState() => _EightPageState();
}

class _EightPageState extends State<EightPage> {
  int count = 0;
  final List<String> variant = ["A", "B", "C"];

  final List<String> question = [
    "1 - Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "2 - Quisque sit amet velit malesuada, scelerisque diam non.",
    "3 - Phasellus auctor blandit neque.",
    "4 - Sed cursus ante dapibus diam.",
  ];

  final List<List<String>> answers = [
    ["Answer 1A", "Answer 1B", "Answer 1C"],
    ["Answer 2A", "Answer 2B", "Answer 2C"],
    ["Answer 3A", "Answer 3B", "Answer 3C"],
    ["Answer 4A", "Answer 4B", "Answer 4C"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TimerCard(
              question: question[count],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 335,
            height: 250,
            child: ListView.builder(
              itemCount: answers[count].length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                  variant: variant[i],
                  question: answers[count][i],
                  onPressed: () {
                    setState(() {
                      if (count < question.length - 1) {
                        count++;
                      } else {
                        // Using pushReplacement instead of push to avoid stacking screens
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const ResultPage())
                        );
                      }
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(0, context),
    );
  }

  // AppBar for the quiz page
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back)),
      title: const Text(
        "Lorem ipsum dolor sit amet...",
        style: TextStyle(fontFamily: "Poppins"),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: CircleAvatar(
            radius: 20,
            child: Center(child: AppIcons.littleFlutter),
          ),
        )
      ],
    );
  }
}