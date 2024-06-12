import 'package:constraints_example/pages/registration_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Constraints Example',
      theme: ThemeData(primarySwatch: Colors.green,),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        'registration': (context) => const RegistrationPage()
      },
    );
  }
}

/// The home page which displays different layouts based on screen width.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('R E S P O N S I V E N E S S')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return const WideLayout();
            } else {
              return const NarrowLayout();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/registration');
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
        Expanded(child: Container(color: Colors.green, height: 200)),
        Expanded(child: Container(color: Colors.green, height: 200)),
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
        Expanded(child: Container(color: Colors.green, height: 200)),
        Expanded(child: Container(color: Colors.green, height: 200)),
      ],
    );
  }
}