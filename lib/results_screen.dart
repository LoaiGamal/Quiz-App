import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++){
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        }
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summary.where((element){
      return element['correct_answer'] == element['user_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(150, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              QuestionsSummary(getSummaryData()),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Restart Quiz!',
                  )),
            ],
          ),
        ));
  }
}
