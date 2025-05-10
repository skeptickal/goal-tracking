import 'package:flutter/material.dart';
import 'package:goal_tracking/common/goals_text.dart';
import 'package:goal_tracking/constants/goals_constants.dart';
import 'package:goal_tracking/theme/goals_theme.dart';

class GoalsScreenWrapper extends StatelessWidget {
  final String? title;
  final Widget Function(BuildContext context) builder;
  final bool hasAppBar;
  final EdgeInsets contentPadding;
  final Widget? bottom;
  final bool fixedBottom;
  final RefreshCallback? onRefresh;
  final String? headerText;
  final String? introText;

  const GoalsScreenWrapper({
    super.key,
    this.title,
    this.hasAppBar = false,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    required this.builder,
    this.bottom,
    this.fixedBottom = false,
    this.onRefresh,
    this.headerText,
    this.introText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hasAppBar
            ? AppBar(
                iconTheme: IconThemeData(color: GoalsTheme.white),
                backgroundColor: GoalsTheme.primary,
                title: GoalsText.titleLarge(
                  text: title ?? GoalsConstants.goals,
                  color: GoalsTheme.white,
                ),
                centerTitle: true,
              )
            : null,
        body: onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: _body(context),
              )
            : _body(context));
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPadding(
        padding: contentPadding,
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            addSemanticIndexes: false,
            [
              if (headerText != null)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: GoalsText.titleLarge(
                      text: headerText!,
                      color: GoalsTheme.primary,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (introText != null)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: GoalsText.bodyLarge(text: introText!),
                  ),
                ),
              Builder(builder: builder),
            ],
          ),
        ),
      ),
      if (bottom != null && fixedBottom)
        SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: bottom,
            ))
    ]);
  }
}
