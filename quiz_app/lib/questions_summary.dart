import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${(data['question_index'] as int) + 1}. ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Your answer: ${data['user_answer']}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Correct answer: ${data['correct_answer']}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              isCorrect
                                  ? MaterialCommunityIcons.check_circle_outline
                                  : MaterialCommunityIcons.close_circle_outline,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isCorrect ? 'Correct' : 'Incorrect',
                              style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(), // Ensure to convert the iterable to a list.
        ),
      ),
    );
  }
}
