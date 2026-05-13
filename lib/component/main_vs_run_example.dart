import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/highlight_view.dart';
import 'package:learning/component/normal_view.dart';

class MainVsRunExample extends StatelessWidget {
  const MainVsRunExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'main v/s runApp',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'main() v/s runApp()'),
          HighlightView(text: 'main()'),
          NormalView(
              text:
                  'The Dart entry point where you can perform initial setup.'),
          NormalView(
              text:
                  'The main() function is the entry point of every Dart application. When you run your Flutter app, the Dart runtime looks for the main() function and starts executing the code from there.'),
          NormalView(
              text:
                  'It\'s where you can set up any necessary initializations before launching your app. For example, you might want to configure services, initialize dependencies, or set up error handling before starting your Flutter app.'),
          CodeView(code: '''
void main() {
  // Initialize services or configurations here
  runApp(MyApp());
}
          '''),
          HighlightView(text: 'runApp()'),
          NormalView(
              text:
                  'A Flutter function that renders the given widget and starts the Flutter app.'),
          NormalView(
              text:
                  'The runApp() function is called within main() to launch the Flutter app. It takes a Widget as an argument and attaches it to the screen as the root of the widget tree.'),
          NormalView(
              text:
                  'It renders the widget passed to it as the root of the widget hierarchy, essentially bootstrapping the Flutter framework.'),
          CodeView(code: '''
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(child: Text('Hello, world!')),
      ),
    );
  }
}

          '''),
        ],
      ),
    );
  }
}
