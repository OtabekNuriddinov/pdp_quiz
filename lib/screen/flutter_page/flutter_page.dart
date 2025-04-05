import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdp_quiz/core/theme/icons.dart';
import 'package:pdp_quiz/screen/flutter_page/flutter_page_component/appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(context),
      ),
    );
  }
}
