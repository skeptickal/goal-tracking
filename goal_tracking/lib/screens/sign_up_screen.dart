import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_screen_wrapper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GoalsScreenWrapper(
        headerText: 'Create New Account',
        introText: 'Already Registered? Log in here.',
        builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ));
  }
}
