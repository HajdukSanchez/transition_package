import 'package:flutter/material.dart';
import 'package:jhs_transitions/jhs_transitions.dart';

// Enum for different routes names in the app.
enum Routes {
  firstPage,
  secondPage,
}

// The routes of the app related by enum names and their corresponding pages.
Map<String, Widget Function(BuildContext)> routes = {
  Routes.firstPage.name: (context) => const FirstPage(),
  Routes.secondPage.name: (context) => const SecondPage(),
};

void main() => runApp(const MyApp());

// Main app widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations package',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.firstPage.name,
      routes: routes,
    );
  }
}

// Initial page of the app.
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
          child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                HsTransitions(
                    context: context,
                    child: const SecondPage(),
                    animation: AnimationType.fadeIn,
                    duration: const Duration(milliseconds: 300));
              },
              child: const Text("Go to page 2"))),
    );
  }
}

// Page to be shown after the first page.
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
        child: Text('Hello SecondPage'),
      ),
    );
  }
}
