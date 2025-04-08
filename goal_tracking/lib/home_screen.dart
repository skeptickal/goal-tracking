import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_screen_wrapper.dart';
import 'package:goal_tracking/common/goals_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GoalsScreenWrapper(
      body: Center(
          child: Column(
        children: [
          GoalsText.titleLarge(text: 'text'),
          GoalsText.bodySmall(text: 'text'),
        ],
      )),
    );
  }
}
