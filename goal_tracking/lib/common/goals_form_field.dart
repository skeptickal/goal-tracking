import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_text.dart';
import 'package:goal_tracking/theme/goals_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GoalsFormField extends StatelessWidget {
  final String name;
  final String? label;
  final bool centerLabel;
  final String? hintText;
  final TextAlign textAlign;
  final bool obscure;

  const GoalsFormField({
    super.key,
    required this.name,
    this.label,
    this.centerLabel = true,
    this.hintText,
    this.textAlign = TextAlign.center,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centerLabel ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (label != null)
          GoalsText.bodyMedium(
            text: label!,
          ),
        SizedBox(height: 12),
        ReactiveTextField<String>(
          obscureText: obscure,
          formControlName: name,
          textAlign: textAlign,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 240, 240, 240),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2.0,
                  color: Colors.transparent,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: GoalsTheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
