import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_text.dart';
import 'package:goal_tracking/constants/goals_constants.dart';
import 'package:goal_tracking/theme/goals_theme.dart';

class GoalsScreenWrapper extends StatelessWidget {
  final String? title;
  final Widget body;
  const GoalsScreenWrapper({
    super.key,
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GoalsTheme.primary,
        title: GoalsText.titleLarge(
          text: title ?? GoalsConstants.goals,
          color: GoalsTheme.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: body),
    );
  }
}
