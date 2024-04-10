# my_calculor
## Flutter Calculator App Documentation
### Overview

This documentation outlines the structure and functionality of a simple calculator app developed in Flutter. The app features a customizable button widget and supports basic arithmetic operations including addition, subtraction, multiplication, division, and percentage calculations.

## Widgets

# MyButton
- Purpose: Represents a reusable button widget for the calculator.
- Properties:
- color: Background color of the button.
- textColor: Color of the button text.
- buttonText: Text displayed on the button.
- buttonTapped: Callback function executed when the button is tapped.
- isDouleWidth (typo should be isDoubleWidth): Boolean to specify if the button should have double width. Note: This feature is mentioned but not implemented in the current code.
- Usage: Used to create each button of the calculator with specific attributes.
## MyApp
- Purpose: The root widget of the application.
- Features: Sets up the MaterialApp with disabled debug banner and specifies the home page.
## HomePage
- Purpose: Serves as the home screen of the calculator app.
- State Management: Uses a stateful widget to manage the user's input (userQuestion) and the calculation result (userAnswer).
- Layout: Organized into two main Expanded widgets; the upper part displays the question and answer, and the lower part is a GridView containing the calculator buttons.
- Functionality

- Input Handling: Users can input numbers and operations via the buttons. The userQuestion string is updated with each button press, and displayed at the top.
Operation Execution: Pressing the '=' button triggers the calculation by parsing the userQuestion string, replacing mathematical operation symbols as necessary for the parser, and evaluating the expression. The result is displayed as userAnswer.
## Special Buttons:
- 'C' clears both question and answer.
- 'DEL' deletes the last character from the question.
- Other buttons represent numbers, decimal points, and mathematical operators.
- Operators Detection: A helper function isOperator determines if a button's text represents an operator to apply specific styling.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# Flutter_Calculator


https://github.com/ChrisNgobeck/Flutter_Calculator/assets/150654899/4deab7c2-4217-4f45-8222-28b638824732




