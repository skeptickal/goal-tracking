import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_form_field.dart';
import 'package:goal_tracking/common/goals_screen_wrapper.dart';
import 'package:goal_tracking/common/goals_text.dart';
import 'package:goal_tracking/theme/goals_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  FormGroup buildForm() => fb.group(<String, Object>{
        'name': FormControl<String>(),
        'email': FormControl<String>(),
        'password': FormControl<String>(),
        'test': FormControl<String>(),
      });

  @override
  Widget build(BuildContext context) {
    return GoalsScreenWrapper(
      headerText: 'Create New Account',
      introText: _SignInIntroText(),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Column(
                children: [
                  SizedBox(height: 24),
                  GoalsFormField(
                    label: 'NAME',
                    name: 'name',
                    hintText: 'John Appleseed',
                  ),
                  SizedBox(height: 24),
                  GoalsFormField(
                    label: 'EMAIL',
                    name: 'email',
                    hintText: 'email@email.com',
                  ),
                  SizedBox(height: 24),
                  GoalsFormField(
                    obscure: true,
                    label: 'PASSWORD',
                    name: 'password',
                    hintText: '**********',
                  ),
                  SizedBox(height: 48),
                  _BottomButtonBar()
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class _SignInIntroText extends StatelessWidget {
  const _SignInIntroText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already Registered? ',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: GoalsTheme.black,
          ),
          children: [
            TextSpan(
              text: 'Log in here.',
              recognizer: TapGestureRecognizer()..onTap = () => print('Jackson hi'),
              style: GoogleFonts.montserrat(fontSize: 18, color: Colors.blueAccent, decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButtonBar extends StatelessWidget {
  const _BottomButtonBar();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: GoalsTheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        height: 70,
        child: GoalsText.bodyMedium(
          text: 'Sign up',
          color: GoalsTheme.white,
        ),
      ),
    );
  }
}
