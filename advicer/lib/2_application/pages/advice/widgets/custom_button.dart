import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: themeData.colorScheme.secondary,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          'Get Advice',
          style: themeData.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
