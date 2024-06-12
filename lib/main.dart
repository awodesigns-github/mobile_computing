import 'package:constraints_example/pages/registration_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Constraints Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

/// The home page which displays different layouts based on screen width.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Design')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Choose the layout based on the screen width.
            if (constraints.maxWidth > 600) {
              return const WideLayout();
            } else {
              return NarrowLayout();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the registration page.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

/// Layout for wide screens.
class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.blue, height: 200)),
        Expanded(child: Container(color: Colors.red, height: 200)),
      ],
    );
  }
}

/// Layout for narrow screens.
class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(color: Colors.blue, height: 200)),
        Expanded(child: Container(color: Colors.red, height: 200)),
      ],
    );
  }
}