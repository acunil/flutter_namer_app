import 'package:flutter/material.dart';

class AppStyles {
  static const double cardPadding = 20.0;
  static const double spacing = 10.0;
  static const double listPadding = 20.0;

  static TextStyle bigCardTextStyle(ThemeData theme) =>
      theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static Card bigCard({
    required Widget child,
    required ThemeData theme,
  }) =>
      Card(
        color: theme.colorScheme.primary,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(cardPadding),
          child: child,
        ),
      );
}