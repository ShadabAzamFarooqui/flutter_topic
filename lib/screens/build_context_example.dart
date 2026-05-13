import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class BuildContextExample extends StatelessWidget {
  const BuildContextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'BuildContext/async/await',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'BuildContext:'),
          NormalView(
              text:
                  'It contain(handle) the location of widget in widget tree. Its most commonly used while page routing (navigating).'),
          CodeView(code: '''Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SecondScreen(data: 'data'),
    ),
  )'''),
          HeadingView(text: 'async'),
          NormalView(
              text:
                  'When you mark a function with async, it indicates that the function will perform asynchronous work and return a Future.'),
          NormalView(
              text:
                  'Inside an async function, you can use await to pause the execution until the awaited Future completes.'),
          HeadingView(text: 'await'),
          NormalView(text: 'Used within an async function to pause execution until the Future you\'re awaiting completes. After the Future completes, execution continues with the result of the Future.'),
          CodeView(code: '''
          
          
Future<void> fetchData() async {
    // Simulate a delay to represent a network call
    await Future.delayed(Duration(seconds: 2));

    // Once the delay is over, update the state
    setState(() {
      data = "Data fetched!";
    });
  }
          
          '''),

          HeadingView(text: 'then'),
          NormalView(text: 'Same as await but await interrupt(pause) the process but then does not.'),


          CodeView(code: '''
          
Future.delayed(Duration(seconds: 2)).then(()=>setState(() {
      data = "Data fetched!";
    }););
  }

          '''),
        ],
      ),
    );
  }
}
