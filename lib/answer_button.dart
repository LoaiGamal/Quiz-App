import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onTab, super.key});

  final String text;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        )
    );
  }
}
