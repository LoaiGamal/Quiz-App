import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            // To have slightly transparent (150)
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 40),
           Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: const LinearBorder(
                      start: LinearBorderEdge(),
                      end: LinearBorderEdge(),
                      top: LinearBorderEdge(),
                      bottom: LinearBorderEdge()),
                  textStyle: const TextStyle(fontSize: 20)),
              icon: const Icon(Icons.arrow_right_alt),
              iconAlignment: IconAlignment.start,
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
