import 'package:flutter/material.dart';

class DateFilterButton extends StatelessWidget {

  final Function() onPressed;
  final String text;

  const DateFilterButton(this.onPressed, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
      child: Text(text)
    );
  }
}