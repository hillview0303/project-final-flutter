import 'package:flutter/material.dart';

class WelcomeNavigatorButton extends StatelessWidget {
  const WelcomeNavigatorButton({
    super.key,
    required this.buttonText,
    required this.routeName,
    this.color,
    this.textColor,
  });

  final String buttonText;
  final Color? color;
  final String routeName;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 100, minHeight: 50),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: FittedBox(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: textColor!,
            ),
          ),
        ),
      ),
    );
  }
}
