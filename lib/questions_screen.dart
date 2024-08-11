import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      // widget variable it's flutter special widget to access stateful widget properties in state class
      widget.onSelectAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                // color: const Color.fromARGB(150, 255, 255, 255),
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            /*
            ... means that if we have nested list it will spread it

            ex: x = [[1,2,3],4,5]
            the result of ...x will be
            [1,2,3,4,5]
             */
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(text: answer, onTab: () {answerQuestion(answer);});
            }),

            // AnswerButton(text: currentQuestion.answers[0], onTab: () {},),
            // AnswerButton(text: currentQuestion.answers[1], onTab: () {},),
            // AnswerButton(text: currentQuestion.answers[2], onTab: () {},),
            // AnswerButton(text: currentQuestion.answers[3], onTab: () {},),
          ],
        ),
      ),
    );
  }
}
