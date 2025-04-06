import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PDPKeypadScreen extends StatefulWidget {
  const PDPKeypadScreen({super.key});

  @override
  State<PDPKeypadScreen> createState() => _PDPKeypadScreenState();
}

class _PDPKeypadScreenState extends State<PDPKeypadScreen> {
  int secondsRemaining = 59;
  String code = '';

  void onKeyPress(BuildContext context, String value) {
    if (value == "delete") {
      setState(() {
        if (code.isNotEmpty) {
          code = code.substring(0, code.length - 1);
        }
      });
    } else if (value == "next") {
      ///Navigator push for Home menu
      // Navigator.push(
      //     context,
      // );
    } else if (code.length < 4) {
      setState(() {
        code += value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Logo
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // PDP Logo
                      SvgPicture.asset(
                        'assets/icons/pdp_logo.svg',
                        width: 70,
                        height: 70,
                      ),
                      const SizedBox(width: 10),
                      // PDP Academy Text

                    ],
                  ),
                ),
              ),
            ),

            // Code input fields
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        index < code.length ? code[index] : "",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Timer text
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Send again after ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "( $secondsRemaining seconds )",
                          style: const TextStyle(color: Color(0xFF4CAF50)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Empty space
            const SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),

            // Numeric keypad using buttons
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    late String keyValue;
                    late Widget keyChild;

                    if (index < 9) {
                      keyValue = "${index + 1}";
                      keyChild = Text(
                        keyValue,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      );
                    } else if (index == 9) {
                      keyValue = "delete";
                      keyChild = const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color(0xFF424242),
                      );
                    } else if (index == 10) {
                      keyValue = "0";
                      keyChild = const Text(
                        "0",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      );
                    } else {
                      keyValue = "next";
                      keyChild = Icon(
                        CupertinoIcons.clear_circled,
                        size: 24.0,
                        color: Colors.grey,
                      );
                    }

                    return ElevatedButton(
                      onPressed: () => onKeyPress(context, keyValue),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFE0E0E0),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: keyChild,
                    );
                  },
                  childCount: 12,
                ),
              ),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}