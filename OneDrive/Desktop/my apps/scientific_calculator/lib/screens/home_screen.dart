import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientific_calculator/providers/calculator_provider.dart';
import 'package:scientific_calculator/widgets/calc_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    // Button Definition
    final List<List<String>> buttons = [
      ['sin', 'cos', 'tan', 'ln'],
      ['C', '(', ')', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['0', '.', '⌫', '='],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display Area
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      provider.expression.isEmpty ? '0' : provider.expression,
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      provider.result,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white24, height: 1),
            // Keypad Area
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: buttons.map((rowButtons) {
                    return Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: rowButtons.map((label) {
                          Color bgColor = const Color(0xFF2E2F38);
                          Color txtColor = Colors.white;

                          // Styles
                          if (['C', '⌫'].contains(label)) {
                            bgColor = const Color(0xFF4B4B5C);
                            txtColor = const Color(0xFFFF6B6B);
                          } else if (['÷', '×', '-', '+', '='].contains(label)) {
                            bgColor = const Color(0xFF4B5EFC);
                          } else if (['sin', 'cos', 'tan', 'ln', '(', ')'].contains(label)) {
                            bgColor = const Color(0xFF1E1F25);
                            txtColor = const Color(0xFF74EBD5);
                          }

                          return Expanded(
                            child: CalcButton(
                              label: label,
                              backgroundColor: bgColor,
                              textColor: txtColor,
                              onTap: () {
                                if (label == 'C') {
                                  provider.clear();
                                } else if (label == '⌫') {
                                  provider.delete();
                                } else if (label == '=') {
                                  provider.evaluate();
                                } else {
                                  provider.addToExpression(label);
                                }
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
