import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

class CalculatorProvider with ChangeNotifier {
  String _expression = '';
  String _result = '0';

  String get expression => _expression;
  String get result => _result;

  void addToExpression(String value) {
    if (_result != '0' && _expression.isEmpty) {
      // If there's a result and we start typing a new operation matches an operator,
      // we might want to continue. But for simple numbers, maybe reset.
      // For now, let's just append.
    }
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '0';
    notifyListeners();
  }

  void delete() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  void evaluate() {
    if (_expression.isEmpty) return;

    try {
      Parser p = Parser();
      // Replace symbols for math_expressions
      String finalExpression = _expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('π', '3.14159265')
          .replaceAll('e', '2.71828182');

      // Handle log vs ln if needed, but math_expressions uses 'log' for base 10 and 'ln' for base e usually
      // or 'log(x, base)'.
      // Let's assume standard math_expressions syntax.

      Expression exp = p.parse(finalExpression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Formatting
      if (eval % 1 == 0) {
        _result = eval.toInt().toString();
      } else {
        _result = eval.toStringAsFixed(4).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
      }
      _expression = ''; // Clear expression after result, or keep it? 
      // Usually calc apps move result to top or keep expression. 
      // Let's clear expression and show result as current state for next op?
      // Actually standard behavior: expression stays or clears. 
      // Let's make expression become the result so we can chain.
      _expression = _result;
      
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }
}
