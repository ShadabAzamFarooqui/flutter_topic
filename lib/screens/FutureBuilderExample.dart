import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class FutureBuilderExample extends StatelessWidget {
  const FutureBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Future Builder Example',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingView(text: 'FutureBuilder'),
            NormalView(
                text:
                    'FutureBuilder is a widget in Flutter that helps you build your UI based on the state of a Future.'),
            CodeView(code: '''Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network delay
    return "Hello, FutureBuilder!";
  }
       '''),
            CodeView(code: '''
FutureBuilder<String>(
 future: fetchData(),
 builder: (context, snapshot) {
   if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); 
   } else if (snapshot.hasError) {
      return Text("Error: \${snapshot.error}"); 
   } else {
      return Text(snapshot.data ?? "No data"); 
   }
 },
)
            
            '''),
            NormalView(text: 'There are three type of ConnectionState.'),
            HeadingView(text: 'ConnectionState.none'),
            NormalView(
                text:
                    'No Future has been provided or the Future has not started yet.'),
            HeadingView(text: 'ConnectionState.waiting'),
            NormalView(
                text:
                    'The Future is still in progress, and data has not yet arrived.'),
            NormalView(
                text:
                    'You usually display a loading indicator during this state.'),
            HeadingView(text: 'ConnectionState.done'),
            NormalView(
                text:
                    'The Future has completed, either with data or an error.'),
            NormalView(
                text:
                    'You display the resulting data or handle the error in this state.'),
          ],
        ));
  }
}
