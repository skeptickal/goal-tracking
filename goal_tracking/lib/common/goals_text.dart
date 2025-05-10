import 'package:flutter/material.dart';
import 'package:goal_tracking/theme/goals_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final bool? italic;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? fontSize;
  final bool? bold;

  const GoalsText.bodySmall({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 12,
    this.bold = false,
  });

  const GoalsText.bodyMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 18,
    this.bold = false,
  });

  const GoalsText.bodyLarge({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 24,
    this.bold = false,
  });

  const GoalsText.titleSmall({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 18,
    this.bold = true,
  });

  const GoalsText.titleMedium({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 32,
    this.bold = true,
  });

  const GoalsText.titleLarge({
    super.key,
    required this.text,
    this.textAlign,
    this.color = GoalsTheme.black,
    this.italic = false,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize = 48,
    this.bold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontStyle: italic ?? false ? FontStyle.italic : FontStyle.normal,
        fontWeight: bold ?? false ? FontWeight.bold : FontWeight.normal,
        color: color ?? GoalsTheme.black,
        textBaseline: TextBaseline.alphabetic,
      ),
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
