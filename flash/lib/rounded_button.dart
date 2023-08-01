import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final VoidCallback callback;
  final String text;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
