import 'package:dev_venture/components/true_false_question.dart';
import 'package:flutter/material.dart';

class TrueFalseDemoPage extends StatefulWidget {
  const TrueFalseDemoPage({super.key});

  @override
  State<TrueFalseDemoPage> createState() => _TrueFalseDemoPageState();
}

class _TrueFalseDemoPageState extends State<TrueFalseDemoPage> {
  int _score = 0;
  int _attempts = 0;

  void _onAnswered(bool isCorrect) {
    setState(() {
      _attempts++;
      if (isCorrect) {
        _score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const contentPadding = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verdadeiro ou Falso'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(contentPadding),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(contentPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _MetricTile(
                          label: 'Acertos',
                          value: _score.toString(),
                          accent: theme.colorScheme.primary,
                        ),
                        _MetricTile(
                          label: 'Tentativas',
                          value: _attempts.toString(),
                          accent: theme.colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TrueFalseQuestion(
                question: 'Flutter é um framework criado pelo Google?',
                correctAnswer: true,
                onAnswered: _onAnswered,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;

  const _MetricTile({
    required this.label,
    required this.value,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: accent,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
