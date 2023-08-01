import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  final String advice;

  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: themeData.colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Text(
          '''"$advice"''',
          style: themeData.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
