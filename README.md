🧮 Scientific Calculator
A sleek, dark-themed Scientific Calculator built with Flutter using the Provider state management pattern. Supports basic arithmetic as well as trigonometric and logarithmic operations.

📱 Features
Basic Arithmetic — Addition, Subtraction, Multiplication, Division
Scientific Functions — sin, cos, tan, ln
Parentheses Support — Group expressions using ( and )
Decimal Input — Enter floating-point numbers
Backspace — Delete the last character (⌫)
Clear — Reset the entire expression and result (C)
Live Result Display — Shows the computed result in real time after pressing =
Expression Chaining — After evaluation, the result is carried forward for further calculations
Dark Theme UI — Modern dark interface with color-coded button groups
🎨 UI Design
Button Group	Color
Numbers (0–9, .)	Dark grey #2E2F38
Operators (÷, ×, -, +, =)	Purple-blue #4B5EFC
Scientific (sin, cos, tan, ln, (, ))	Dark with cyan text #74EBD5
Clear / Delete (C, ⌫)	Darker grey with red text #FF6B6B
Background color: #17171C
Rounded buttons with ripple ink-well effect
Two-section layout: Display Area (top) + Keypad (bottom)
🗂️ Project Structure
scientific_calculator/
├── lib/
│   ├── main.dart                        # App entry point, theme & Provider setup
│   ├── screens/
│   │   └── home_screen.dart             # Main calculator UI & button layout
│   ├── widgets/
│   │   └── calc_button.dart             # Reusable calculator button widget
│   └── providers/
│       └── calculator_provider.dart     # State management & expression evaluation
├── pubspec.yaml                         # Project dependencies
└── README.md
🧠 Architecture
This app follows the Provider pattern for state management:

CalculatorProvider — Holds the current expression and result. Exposes methods:

addToExpression(value) — Appends a character/function to the expression
clear() — Resets expression and result
delete() — Removes the last character
evaluate() — Parses and evaluates the expression using math_expressions
HomeScreen — Stateless widget that reads from CalculatorProvider via Provider.of and renders the display + keypad

CalcButton — Reusable stateless widget for each calculator button, accepting label, colors, and a callback

📦 Dependencies
Package	Version	Purpose
flutter	SDK	Core framework
provider	^6.1.2	State management
math_expressions	^2.6.0	Expression parsing & evaluation
cupertino_icons	^1.0.8	Icon support
🚀 Getting Started
Prerequisites
Flutter SDK >=3.0.0 <4.0.0
A connected device or emulator
Run the App
# Clone the repository
git clone <your-repo-url>
cd scientific_calculator

# Get dependencies
flutter pub get

# Run on your device/emulator
flutter run
🔧 How It Works
The user taps buttons to build an expression (e.g., sin(30)+5×2)
Symbols like × and ÷ are internally replaced with * and / before parsing
The math_expressions package parses and evaluates the expression
The result is displayed with up to 4 decimal places (trailing zeros removed)
After evaluation, the result is loaded back into the expression for further chaining
📋 Supported Operations
Operation	Button
Sine	sin
Cosine	cos
Tangent	tan
Natural Log	ln
Division	÷
Multiplication	×
Subtraction	-
Addition	+
Parentheses	( )
Decimal	.
Backspace	⌫
Clear All	C
Evaluate	=
