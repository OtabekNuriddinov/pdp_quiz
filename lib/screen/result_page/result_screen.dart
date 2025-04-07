
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/theme/icons.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(0, context),
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              // alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 250,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                Positioned(
                  left: MediaQuery.sizeOf(context).width-290,
                  top: 20,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(50),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(100),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("Your",
                                  style: TextStyle(color: Colors.green)),
                              Text("Result",
                                  style: TextStyle(color: Colors.green)),
                              Text("15",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 26,
                  child: Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width-90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.1, 1),
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Dot(color: AppColors.green),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 correct answers   ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Dot(color: Colors.red),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "7 incorrect answers",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 170,
            ),
            myCustomButton(text: "Restart the test"),
            SizedBox(height: 40,),
            myCustomButton(text: "Return to main menu"),

          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
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
      SizedBox(
        height: 20,
        width: 20,
        child: AppIcons.littleFlutter,
      ),
      SizedBox(width: 20,)
    ],
  );
}


Container myCustomButton({required String text}){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Colors.green,
        width: 2,
      ),
    ),
    child: SizedBox(
      height: 54,
      width: 335,
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding:
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: text,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              // TextSpan(text: "$question"),
            ],
          ),
        ),
      ),
    ),
  );
}

class Dot extends StatelessWidget {
  final Color color;
  const Dot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
