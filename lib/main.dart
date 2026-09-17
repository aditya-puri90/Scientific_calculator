import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const ScientificCalculator());
}

class ScientificCalculator extends StatelessWidget {
  const ScientificCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _expression = '';
  bool _isResult = false;
  double _memory = 0.0;

  void _onButtonPressed(String value) {
    setState(() {
      if (_isResult) {
        _display = '0';
        _expression = '';
        _isResult = false;
      }

      if (value == 'C') {
        _display = '0';
        _expression = '';
      } else if (value == 'CE') {
        _display = '0';
      } else if (value == '⌫') {
        if (_display.length > 1) {
          _display = _display.substring(0, _display.length - 1);
        } else {
          _display = '0';
        }
        _expression = _expression.isNotEmpty
            ? _expression.substring(0, _expression.length - 1)
            : '';
      } else if (value == '=') {
        try {
          double result = _evaluateExpression(_display);
          if (result.isInfinite || result.isNaN) {
            _display = 'Error';
          } else {
            _display = _formatNumber(result);
            _expression = _display;
          }
          _isResult = true;
        } catch (e) {
          _display = 'Error';
          _isResult = true;
        }
      } else if (value == 'sin' || value == 'cos' || value == 'tan' ||
          value == 'log' || value == 'ln' || value == '√') {
        if (_display == '0' || _isResult) {
          _display = value + '(';
          _expression = value + '(';
        } else {
          _display += value + '(';
          _expression += value + '(';
        }
      } else if (value == 'x²') {
        if (_display != '0' && !_isResult) {
          try {
            double num = double.parse(_display);
            double result = num * num;
            _display = _formatNumber(result);
            _expression = _display;
            _isResult = true;
          } catch (e) {
            _display = 'Error';
          }
        }
      } else if (value == 'x³') {
        if (_display != '0' && !_isResult) {
          try {
            double num = double.parse(_display);
            double result = num * num * num;
            _display = _formatNumber(result);
            _expression = _display;
            _isResult = true;
          } catch (e) {
            _display = 'Error';
          }
        }
      } else if (value == '1/x') {
        if (_display != '0' && !_isResult) {
          try {
            double num = double.parse(_display);
            if (num != 0) {
              double result = 1 / num;
              _display = _formatNumber(result);
              _expression = _display;
              _isResult = true;
            } else {
              _display = 'Error';
            }
          } catch (e) {
            _display = 'Error';
          }
        }
      } else if (value == 'MC') {
        _memory = 0.0;
      } else if (value == 'MR') {
        _display = _formatNumber(_memory);
        _expression = _display;
        _isResult = true;
      } else if (value == 'M+') {
        try {
          double num = double.parse(_display);
          _memory += num;
        } catch (e) {
          // Ignore
        }
      } else if (value == 'M-') {
        try {
          double num = double.parse(_display);
          _memory -= num;
        } catch (e) {
          // Ignore
        }
      } else {
        if (_display == '0') {
          _display = value;
        } else {
          _display += value;
        }
        _expression += value;
      }
    });
  }

  double _evaluateExpression(String expression) {
    // Replace display symbols with parseable symbols
    String expr = expression;
    expr = expr.replaceAll('×', '*');
    expr = expr.replaceAll('÷', '/');
    expr = expr.replaceAll('π', '${math.pi}');
    expr = expr.replaceAll('e', '${math.e}');

    // Handle scientific functions recursively from innermost to outermost
    expr = _replaceScientificFunctions(expr);

    // Parse and evaluate
    Parser p = Parser();
    Expression exp = p.parse(expr);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  String _replaceScientificFunctions(String expr) {
    // Process from right to left to handle nested functions correctly
    bool changed = true;
    int iterations = 0;
    const maxIterations = 100; // Prevent infinite loops

    while (changed && iterations < maxIterations) {
      changed = false;
      iterations++;

      // Find the rightmost function call
      int sinPos = expr.lastIndexOf('sin(');
      int cosPos = expr.lastIndexOf('cos(');
      int tanPos = expr.lastIndexOf('tan(');
      int logPos = expr.lastIndexOf('log(');
      int lnPos = expr.lastIndexOf('ln(');
      int sqrtPos = expr.lastIndexOf('√(');

      int maxPos = -1;
      String? funcName;
      int funcLen = 0;

      if (sinPos > maxPos) {
        maxPos = sinPos;
        funcName = 'sin';
        funcLen = 3;
      }
      if (cosPos > maxPos) {
        maxPos = cosPos;
        funcName = 'cos';
        funcLen = 3;
      }
      if (tanPos > maxPos) {
        maxPos = tanPos;
        funcName = 'tan';
        funcLen = 3;
      }
      if (logPos > maxPos) {
        maxPos = logPos;
        funcName = 'log';
        funcLen = 3;
      }
      if (lnPos > maxPos) {
        maxPos = lnPos;
        funcName = 'ln';
        funcLen = 2;
      }
      if (sqrtPos > maxPos) {
        maxPos = sqrtPos;
        funcName = '√';
        funcLen = 1;
      }

      if (maxPos != -1 && funcName != null) {
        int start = maxPos;
        int parenStart = start + funcLen;
        int end = _findMatchingParenthesis(expr, parenStart);
        
        if (end != -1) {
          String inner = expr.substring(parenStart + 1, end);
          
          // Evaluate inner expression (may contain more functions)
          String processedInner = _replaceScientificFunctions(inner);
          double value = _evaluateSimpleExpression(processedInner);
          double result;

          switch (funcName) {
            case 'sin':
              result = math.sin(value);
              break;
            case 'cos':
              result = math.cos(value);
              break;
            case 'tan':
              result = math.tan(value);
              break;
            case 'log':
              result = math.log(value) / math.ln10;
              break;
            case 'ln':
              result = math.log(value);
              break;
            case '√':
              result = math.sqrt(value);
              break;
            default:
              result = value;
          }

          expr = expr.substring(0, start) + 
                 result.toString() + 
                 expr.substring(end + 1);
          changed = true;
        }
      }
    }

    return expr;
  }

  double _evaluateSimpleExpression(String expr) {
    // Simple expression evaluator for inner expressions
    expr = expr.replaceAll('×', '*');
    expr = expr.replaceAll('÷', '/');
    expr = expr.replaceAll('π', '${math.pi}');
    expr = expr.replaceAll('e', '${math.e}');
    
    Parser p = Parser();
    Expression exp = p.parse(expr);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  int _findMatchingParenthesis(String expr, int start) {
    int depth = 1;
    for (int i = start + 1; i < expr.length; i++) {
      if (expr[i] == '(') depth++;
      if (expr[i] == ')') {
        depth--;
        if (depth == 0) return i;
      }
    }
    return -1;
  }

  String _formatNumber(double number) {
    if (number % 1 == 0) {
      return number.toInt().toString();
    } else {
      String formatted = number.toStringAsFixed(10);
      while (formatted.endsWith('0') && formatted.contains('.')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
      if (formatted.endsWith('.')) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
      return formatted;
    }
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[800],
            foregroundColor: textColor ?? Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const Divider(),
          // Scrollable button area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
          // Memory buttons
          Row(
            children: [
              _buildButton('MC', color: Colors.grey[700]),
              _buildButton('MR', color: Colors.grey[700]),
              _buildButton('M+', color: Colors.grey[700]),
              _buildButton('M-', color: Colors.grey[700]),
            ],
          ),
          // Scientific functions row 1
          Row(
            children: [
              _buildButton('sin', color: Colors.blue[700]),
              _buildButton('cos', color: Colors.blue[700]),
              _buildButton('tan', color: Colors.blue[700]),
              _buildButton('log', color: Colors.blue[700]),
            ],
          ),
          // Scientific functions row 2
          Row(
            children: [
              _buildButton('ln', color: Colors.blue[700]),
              _buildButton('√', color: Colors.blue[700]),
              _buildButton('x²', color: Colors.blue[700]),
              _buildButton('x³', color: Colors.blue[700]),
            ],
          ),
          // Numbers and operations
          Row(
            children: [
              _buildButton('(', color: Colors.orange[700]),
              _buildButton(')', color: Colors.orange[700]),
              _buildButton('π', color: Colors.orange[700]),
              _buildButton('e', color: Colors.orange[700]),
            ],
          ),
          Row(
            children: [
              _buildButton('C', color: Colors.red[700]),
              _buildButton('CE', color: Colors.red[700]),
              _buildButton('⌫', color: Colors.red[700]),
              _buildButton('÷', color: Colors.orange[700]),
            ],
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('×', color: Colors.orange[700]),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-', color: Colors.orange[700]),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('+', color: Colors.orange[700]),
            ],
          ),
          Row(
            children: [
              _buildButton('1/x', color: Colors.blue[700]),
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('=', color: Colors.green[700]),
            ],
          ),
                  // Bottom padding to prevent overflow
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

