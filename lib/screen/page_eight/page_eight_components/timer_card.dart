import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class TimerCard extends StatefulWidget {
  final String question;
  const TimerCard({super.key, required this.question});

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
          height: 192,
          decoration: BoxDecoration(
            color: AppColors.green2,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.question,
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
