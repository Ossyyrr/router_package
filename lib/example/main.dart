import 'package:flutter/material.dart';
import 'package:route_transitions_pm/route_transitions_pm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'page1',
      routes: {
        'page1': (_) => const Page1(),
        'page2': (_) => const Page2(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
          child: MaterialButton(
        onPressed: () {
          RouteTransitions(
            context: context,
            child: const Page2(),
            animation: AnimationType.fadeIn,
            duration: const Duration(milliseconds: 600),
            // replacement: true,
          );
        },
        child: const Text('Go to page 2'),
        color: Colors.white,
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.amber,
      body: Center(
          child: MaterialButton(
        onPressed: () {
          RouteTransitions(
            context: context,
            child: const Page1(),
            animation: AnimationType.fadeIn,
            duration: const Duration(milliseconds: 600),
            // replacement: true,
          );
        },
        child: const Text('Go to page 1'),
        color: Colors.white,
      )),
    );
  }
}
