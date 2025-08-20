import 'package:flutter/material.dart';
import '../models/word_pair_model.dart';
import '../styles/app_styles.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPairModel pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppStyles.bigCard(
      theme: theme,
      child: Text(
        pair.asPascalCase,
        style: AppStyles.bigCardTextStyle(theme),
        semanticsLabel: pair.semanticsLabel,
      ),
    );
  }
}