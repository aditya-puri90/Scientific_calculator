# Scientific Calculator - Complete Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [System Requirements](#system-requirements)
3. [Tools & Technologies](#tools--technologies)
4. [Core Concepts](#core-concepts)
5. [Project Structure](#project-structure)
6. [Installation & Setup](#installation--setup)
7. [Features Documentation](#features-documentation)
8. [Architecture & Design](#architecture--design)
9. [Code Explanation](#code-explanation)
10. [Building & Deployment](#building--deployment)
11. [Troubleshooting](#troubleshooting)
12. [Future Enhancements](#future-enhancements)

---

## Project Overview

**Scientific Calculator** is a feature-rich mobile and web application built with Flutter that provides advanced mathematical calculations including basic arithmetic, trigonometric functions, logarithmic operations, and memory management.

### Key Highlights
- Cross-platform support (Android, iOS, Web, Windows)
- Modern Material Design 3 UI with dark theme
- Comprehensive scientific functions
- Memory operations support
- Expression parsing and evaluation

---

## System Requirements

### Development Environment

#### Minimum Requirements
- **Operating System**: Windows 10/11, macOS 10.14+, or Linux (64-bit)
- **RAM**: 8 GB minimum (16 GB recommended)
- **Storage**: 2.5 GB free space for Flutter SDK and dependencies
- **Processor**: Multi-core processor (Intel/AMD)

#### Software Requirements
- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Included with Flutter (3.0.0+)
- **Git**: For version control
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA

#### Platform-Specific Requirements

**For Android Development:**
- Android Studio (latest version)
- Android SDK (API level 21 or higher)
- Android SDK Platform-Tools
- Android Emulator or physical Android device
- Java Development Kit (JDK) 11 or higher

**For iOS Development (macOS only):**
- Xcode 14.0 or higher
- CocoaPods
- iOS Simulator or physical iOS device
- Apple Developer Account (for device testing)

**For Web Development:**
- Chrome, Edge, Firefox, or Safari browser
- Web server (handled by Flutter)

**For Windows Development:**
- Visual Studio 2019 or higher
- Windows 10 SDK
- Desktop development with C++ workload

---

## Tools & Technologies

### Primary Technologies

#### 1. **Flutter Framework**
- **Version**: 3.0.0+
- **Purpose**: Cross-platform UI framework
- **Key Features Used**:
  - Material Design 3 components
  - StatefulWidget for state management
  - Responsive layout system
  - Hot reload for development

#### 2. **Dart Programming Language**
- **Version**: 3.0.0+
- **Purpose**: Primary programming language
- **Key Features Used**:
  - Object-oriented programming
  - Async/await for asynchronous operations
  - Null safety
  - Type system

#### 3. **math_expressions Package**
- **Version**: ^2.4.0
- **Purpose**: Mathematical expression parsing and evaluation
- **Key Features**:
  - Expression parsing
  - Context-based evaluation
  - Support for operators and functions

#### 4. **dart:math Library**
- **Purpose**: Built-in mathematical functions
- **Functions Used**:
  - `sin()`, `cos()`, `tan()` - Trigonometric functions
  - `log()` - Natural logarithm
  - `sqrt()` - Square root
  - Constants: `pi`, `e`

### Development Tools

#### IDEs & Editors
- **VS Code**: Recommended with Flutter extension
- **Android Studio**: Full IDE with Flutter plugin
- **IntelliJ IDEA**: Alternative IDE option

#### Command Line Tools
- **Flutter CLI**: Project management and building
- **Dart CLI**: Code analysis and formatting
- **ADB (Android Debug Bridge)**: Android device communication
- **Git**: Version control

#### Build Tools
- **Gradle**: Android build system
- **Xcode Build Tools**: iOS build system (macOS)
- **Web Compiler**: Dart-to-JavaScript compilation

---

## Core Concepts

### 1. **Flutter Widget System**
- **StatelessWidget**: Immutable widgets (e.g., `ScientificCalculator`)
- **StatefulWidget**: Stateful widgets (e.g., `CalculatorScreen`)
- **State Management**: Using `setState()` for UI updates
- **Widget Tree**: Hierarchical component structure

### 2. **Material Design 3**
- **Theme System**: Dark theme configuration
- **Material Components**: Buttons, AppBar, Scaffold
- **Color System**: Primary, secondary, and accent colors

### 3. **Mathematical Expression Evaluation**
- **Expression Parsing**: Converting string to expression tree
- **Context Model**: Variable and function context
- **Evaluation Types**: Real number evaluation
- **Function Handling**: Custom function evaluation

### 4. **State Management**
- **Local State**: Component-level state management
- **State Variables**:
  - `_display`: Current display string
  - `_expression`: Internal expression string
  - `_isResult`: Result display flag
  - `_memory`: Memory storage value

### 5. **UI Layout Concepts**
- **Column**: Vertical layout container
- **Row**: Horizontal layout container
- **Expanded**: Flexible widget sizing
- **SingleChildScrollView**: Scrollable content
- **Container**: Styling and padding wrapper

### 6. **Event Handling**
- **Button Press Events**: User interaction handling
- **State Updates**: Triggering UI rebuilds
- **Error Handling**: Try-catch for invalid expressions

---

## Project Structure

```
Scientific_calculator/
│
├── lib/
│   └── main.dart                 # Main application code
│
├── android/                      # Android platform files
│   ├── app/
│   │   ├── build.gradle.kts     # App-level build configuration
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml
│   │           └── kotlin/
│   │               └── MainActivity.kt
│   ├── build.gradle.kts         # Project-level build configuration
│   └── gradle/                   # Gradle wrapper files
│
├── ios/                          # iOS platform files (macOS only)
│   ├── Runner/
│   │   ├── AppDelegate.swift
│   │   └── Info.plist
│   └── Runner.xcodeproj/
│
├── web/                          # Web platform files
│   └── index.html
│
├── test/                         # Unit and widget tests
│   └── widget_test.dart
│
├── build/                        # Build output directory
│   └── app/
│       └── outputs/
│           └── flutter-apk/
│               └── app-debug.apk # Generated APK file
│
├── pubspec.yaml                  # Project dependencies and metadata
├── README.md                     # Basic project documentation
├── DOCUMENTATION.md              # This comprehensive documentation
├── MOBILE_SETUP.md              # Mobile setup instructions
├── .gitignore                    # Git ignore rules
└── analysis_options.yaml         # Dart analyzer configuration
```

### Key Files Explained

#### `lib/main.dart`
- Contains all application logic
- Main entry point: `main()` function
- Calculator UI and functionality
- Expression evaluation logic

#### `pubspec.yaml`
- Project metadata and version
- Dependencies declaration
- Flutter configuration
- Asset declarations

#### `android/` Directory
- Android-specific configurations
- Gradle build files
- AndroidManifest.xml for permissions
- Native Android code (Kotlin)

---

## Installation & Setup

### Step 1: Install Flutter SDK

#### Windows
```powershell
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
# Extract to C:\flutter (or your preferred location)
# Add to PATH: C:\flutter\bin
```

#### macOS
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/macos
# Extract to ~/flutter
# Add to PATH: export PATH="$PATH:`pwd`/flutter/bin"
```

#### Linux
```bash
# Download Flutter SDK from https://flutter.dev/docs/get-started/install/linux
# Extract to ~/flutter
# Add to PATH: export PATH="$PATH:`pwd`/flutter/bin"
```

### Step 2: Verify Installation
```bash
flutter doctor
```

### Step 3: Install Platform-Specific Tools

#### Android Setup
1. Install Android Studio
2. Install Android SDK (API 21+)
3. Accept Android licenses:
   ```bash
   flutter doctor --android-licenses
   ```

#### iOS Setup (macOS only)
1. Install Xcode from App Store
2. Install CocoaPods:
   ```bash
   sudo gem install cocoapods
   ```

### Step 4: Clone/Download Project
```bash
# If using Git
git clone <repository-url>
cd Scientific_calculator

# Or download and extract ZIP file
```

### Step 5: Install Dependencies
```bash
flutter pub get
```

### Step 6: Run the App
```bash
# Check available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run on web
flutter run -d chrome

# Run on Android
flutter run -d android

# Run on iOS (macOS only)
flutter run -d ios
```

---

## Features Documentation

### 1. Basic Arithmetic Operations

#### Addition (+)
- **Usage**: Tap number, tap `+`, tap number, tap `=`
- **Example**: `5 + 3 = 8`
- **Implementation**: Standard addition operator

#### Subtraction (-)
- **Usage**: Tap number, tap `-`, tap number, tap `=`
- **Example**: `10 - 4 = 6`
- **Implementation**: Standard subtraction operator

#### Multiplication (×)
- **Usage**: Tap number, tap `×`, tap number, tap `=`
- **Example**: `6 × 7 = 42`
- **Implementation**: `*` operator in expression parser

#### Division (÷)
- **Usage**: Tap number, tap `÷`, tap number, tap `=`
- **Example**: `20 ÷ 4 = 5`
- **Implementation**: `/` operator with division by zero check

### 2. Scientific Functions

#### Trigonometric Functions

**Sine (sin)**
- **Usage**: Tap `sin(`, enter angle, close parenthesis
- **Example**: `sin(30)` → evaluates to sine of 30 radians
- **Implementation**: `math.sin(value)`
- **Note**: Input is in radians

**Cosine (cos)**
- **Usage**: Tap `cos(`, enter angle, close parenthesis
- **Example**: `cos(0)` → evaluates to 1
- **Implementation**: `math.cos(value)`

**Tangent (tan)**
- **Usage**: Tap `tan(`, enter angle, close parenthesis
- **Example**: `tan(45)` → evaluates tangent
- **Implementation**: `math.tan(value)`

#### Logarithmic Functions

**Logarithm Base 10 (log)**
- **Usage**: Tap `log(`, enter number, close parenthesis
- **Example**: `log(100)` → evaluates to 2
- **Implementation**: `math.log(value) / math.ln10`

**Natural Logarithm (ln)**
- **Usage**: Tap `ln(`, enter number, close parenthesis
- **Example**: `ln(e)` → evaluates to 1
- **Implementation**: `math.log(value)`

#### Power Functions

**Square (x²)**
- **Usage**: Enter number, tap `x²`
- **Example**: `5 x²` → evaluates to 25
- **Implementation**: `number * number`

**Cube (x³)**
- **Usage**: Enter number, tap `x³`
- **Example**: `3 x³` → evaluates to 27
- **Implementation**: `number * number * number`

**Square Root (√)**
- **Usage**: Tap `√(`, enter number, close parenthesis
- **Example**: `√(16)` → evaluates to 4
- **Implementation**: `math.sqrt(value)`

**Reciprocal (1/x)**
- **Usage**: Enter number, tap `1/x`
- **Example**: `4 1/x` → evaluates to 0.25
- **Implementation**: `1 / number`

### 3. Constants

#### Pi (π)
- **Value**: 3.141592653589793
- **Usage**: Tap `π` button
- **Implementation**: Replaced with `math.pi` value

#### Euler's Number (e)
- **Value**: 2.718281828459045
- **Usage**: Tap `e` button
- **Implementation**: Replaced with `math.e` value

### 4. Memory Functions

#### Memory Clear (MC)
- **Function**: Clears memory to 0
- **Usage**: Tap `MC` button
- **Implementation**: Sets `_memory = 0.0`

#### Memory Recall (MR)
- **Function**: Displays current memory value
- **Usage**: Tap `MR` button
- **Implementation**: Displays `_memory` value

#### Memory Add (M+)
- **Function**: Adds current display value to memory
- **Usage**: Enter number, tap `M+`
- **Implementation**: `_memory += displayValue`

#### Memory Subtract (M-)
- **Function**: Subtracts current display value from memory
- **Usage**: Enter number, tap `M-`
- **Implementation**: `_memory -= displayValue`

### 5. Control Functions

#### Clear (C)
- **Function**: Clears display and expression
- **Usage**: Tap `C` button
- **Implementation**: Resets `_display` and `_expression`

#### Clear Entry (CE)
- **Function**: Clears current display only
- **Usage**: Tap `CE` button
- **Implementation**: Resets `_display` to '0'

#### Backspace (⌫)
- **Function**: Deletes last character
- **Usage**: Tap `⌫` button
- **Implementation**: Removes last character from display and expression

#### Equals (=)
- **Function**: Evaluates expression
- **Usage**: Tap `=` button
- **Implementation**: Parses and evaluates `_expression`

### 6. Parentheses Support
- **Function**: Group operations for order of operations
- **Usage**: Tap `(` and `)` buttons
- **Example**: `(5 + 3) × 2 = 16`
- **Implementation**: Standard parentheses in expression parser

---

## Architecture & Design

### Application Architecture

```
┌─────────────────────────────────────┐
│      ScientificCalculator           │
│      (StatelessWidget)              │
│  - MaterialApp                      │
│  - Theme Configuration              │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│      CalculatorScreen              │
│      (StatefulWidget)              │
│  - State Management                │
│  - UI Layout                       │
└──────────────┬──────────────────────┘
               │
       ┌───────┴────────┐
       │                │
       ▼                ▼
┌─────────────┐  ┌──────────────┐
│   Display   │  │   Buttons    │
│   Widget    │  │   Grid       │
└─────────────┘  └──────────────┘
```

### State Management Flow

```
User Input → _onButtonPressed()
    │
    ├─→ Update _display
    ├─→ Update _expression
    ├─→ Update _isResult flag
    └─→ setState() → UI Rebuild
```

### Expression Evaluation Flow

```
Display String → _evaluateExpression()
    │
    ├─→ Replace symbols (× → *, ÷ → /)
    ├─→ Replace constants (π → pi, e → e)
    ├─→ _replaceScientificFunctions()
    │   ├─→ Find function calls
    │   ├─→ Extract arguments
    │   ├─→ Evaluate recursively
    │   └─→ Replace with result
    ├─→ Parse expression
    ├─→ Evaluate with ContextModel
    └─→ Format and display result
```

---

## Code Explanation

### Main Components

#### 1. ScientificCalculator (StatelessWidget)
```dart
class ScientificCalculator extends StatelessWidget {
  // Root widget that sets up MaterialApp
  // Configures theme (dark mode)
  // Sets home screen to CalculatorScreen
}
```

#### 2. CalculatorScreen (StatefulWidget)
```dart
class CalculatorScreen extends StatefulWidget {
  // Main calculator screen
  // Manages calculator state
}
```

#### 3. _CalculatorScreenState (State)
```dart
class _CalculatorScreenState extends State<CalculatorScreen> {
  // State variables:
  String _display = '0';        // Current display
  String _expression = '';       // Internal expression
  bool _isResult = false;       // Result display flag
  double _memory = 0.0;         // Memory storage
  
  // Key methods:
  void _onButtonPressed(String value)  // Handle button presses
  double _evaluateExpression(String expression)  // Evaluate math
  String _formatNumber(double number)  // Format display
  Widget _buildButton(...)  // Build button widgets
}
```

### Key Methods Explained

#### `_onButtonPressed(String value)`
- Handles all button press events
- Updates state based on button type
- Triggers UI rebuild via `setState()`

#### `_evaluateExpression(String expression)`
- Converts display string to evaluable expression
- Replaces UI symbols with parser symbols
- Handles scientific functions
- Returns evaluated result

#### `_replaceScientificFunctions(String expr)`
- Processes scientific function calls
- Handles nested functions recursively
- Evaluates from innermost to outermost
- Returns expression with functions replaced

#### `_formatNumber(double number)`
- Formats numbers for display
- Removes trailing zeros
- Handles integers vs decimals

#### `_buildButton(String text, ...)`
- Creates reusable button widget
- Applies styling and colors
- Handles button press events

---

## Building & Deployment

### Building APK (Android)

#### Debug APK
```bash
flutter build apk --debug
```
- **Output**: `build/app/outputs/flutter-apk/app-debug.apk`
- **Size**: ~137 MB
- **Use**: Testing and development

#### Release APK
```bash
flutter build apk --release
```
- **Output**: `build/app/outputs/flutter-apk/app-release.apk`
- **Size**: Smaller, optimized
- **Use**: Production deployment

#### Split APKs (by ABI)
```bash
flutter build apk --split-per-abi
```
- Creates separate APKs for different architectures
- Smaller file sizes per device type

### Building App Bundle (Google Play)

```bash
flutter build appbundle --release
```
- **Output**: `build/app/outputs/bundle/release/app-release.aab`
- **Use**: Upload to Google Play Store

### Building for iOS (macOS only)

```bash
flutter build ios --release
```
- Requires Xcode and Apple Developer account
- Outputs to `build/ios/`

### Building for Web

```bash
flutter build web --release
```
- **Output**: `build/web/`
- Deploy to any web server
- Optimized for production

### Building for Windows

```bash
flutter build windows --release
```
- **Output**: `build/windows/`
- Creates executable files

---

## Troubleshooting

### Common Issues

#### 1. Flutter Doctor Issues
**Problem**: Android licenses not accepted
```bash
flutter doctor --android-licenses
# Accept all licenses
```

**Problem**: No devices found
- Check USB debugging enabled
- Verify device drivers installed
- Try `adb devices` to test connection

#### 2. Build Errors

**Gradle Build Failed**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter build apk
```

**Dependency Issues**
```bash
flutter pub cache repair
flutter pub get
```

#### 3. Runtime Errors

**Expression Parse Error**
- Check for unmatched parentheses
- Verify function syntax (e.g., `sin(30)`)
- Ensure valid number format

**Overflow Issues**
- Fixed in latest version with scrollable layout
- Reduced button padding and margins

#### 4. Performance Issues

**Slow Build Times**
- Use `--release` flag for production builds
- Enable build caching
- Close unnecessary applications

---

## Future Enhancements

### Planned Features
1. **History**: Save calculation history
2. **Themes**: Light/dark theme toggle
3. **Unit Conversion**: Convert between units
4. **Graphing**: Plot mathematical functions
5. **Export**: Export calculations to file
6. **Voice Input**: Voice-activated calculations
7. **Custom Functions**: User-defined functions
8. **Scientific Notation**: Display large/small numbers
9. **Angle Modes**: Degrees/Radians toggle
10. **Multi-line Display**: Show full expression history

### Technical Improvements
1. **State Management**: Migrate to Provider/Riverpod
2. **Testing**: Add unit and widget tests
3. **Accessibility**: Improve screen reader support
4. **Internationalization**: Multi-language support
5. **Performance**: Optimize expression evaluation
6. **Error Handling**: Better error messages
7. **Animations**: Add smooth transitions
8. **Haptic Feedback**: Vibration on button press

---

## Additional Resources

### Official Documentation
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)

### Package Documentation
- [math_expressions](https://pub.dev/packages/math_expressions)

### Learning Resources
- [Flutter Codelabs](https://codelabs.developers.google.com/?cat=Flutter)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

### Community
- [Flutter Discord](https://discord.gg/flutter)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)

---

## License

This project is open source and available for personal and educational use.

---

## Version History

### Version 1.0.0+1 (Current)
- Initial release
- Basic and scientific functions
- Memory operations
- Dark theme UI
- Fixed overflow issues
- Cross-platform support

---

## Contact & Support

For issues, questions, or contributions, please refer to the project repository or create an issue ticket.

---

**Last Updated**: December 29, 2025
**Documentation Version**: 1.0

