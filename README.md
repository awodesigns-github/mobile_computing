# Constraints Example

## Features

- Responsive Design: The layout adapts to the screen size using `SafeArea`, `Expanded`, `MediaQuery`, and `LayoutBuilder`.
- State Management: A registration form where user inputs are collected and displayed on a summary page after form submission.

## Project Structure

- `main.dart`: The main entry point of the application, implementing responsive design and navigation.
- `registration_page.dart`: Contains the registration form and handles state management, including navigating to the summary page.

## Responsive Design

The `HomePage` widget uses `LayoutBuilder` to switch between two layouts:
- WideLayout: Displayed on screens wider than 600 pixels.
- NarrowLayout: Displayed on screens narrower than 600 pixels.
