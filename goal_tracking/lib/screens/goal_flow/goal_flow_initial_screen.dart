import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_screen_wrapper.dart';
import 'package:goal_tracking/common/goals_text.dart';

class GoalFlowInitialScreen extends StatelessWidget {
  const GoalFlowInitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GoalsScreenWrapper(
      title: 'Goal Flow',
      builder: (context) => GoalsText.bodyLarge(text: 'text'),
    );
  }
}
