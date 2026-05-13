import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class StreamExample extends StatelessWidget {
  const StreamExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Stream',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingView(text: 'Stream'),
          const NormalView(
              text:
                  'A stream is a sequence of events or data that can be listen over the time. Itt allows us to handle and process continuous or multiple piece of data asynchronously'),
          const CodeView(code: '''
          
          |---------------------------------|
input->========================>Output
input->========================>Output
          |---------------------------------|
          '''),
          Image.asset('assets/stream.png'),
          const NormalView(
            text: 'listener/output is a subscriber.',
          ),
          const NormalView(
            text: 'input is sink.',
          ),
          const CodeView(code: '''
import 'dart:async';
import 'package:flutter/material.dart';




class CounterStreamExample extends StatefulWidget {
  @override
  _CounterStreamExampleState createState() => _CounterStreamExampleState();
}

class _CounterStreamExampleState extends State<CounterStreamExample> {
  final StreamController<int> _counterController = StreamController<int>();
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    _counterController.sink.add(_counter); // Add the new count to the stream
  }

  @override
  void dispose() {
    _counterController.close(); // Always close the stream controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Example"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterController.stream,
          initialData: _counter,
          builder: (context, snapshot) {
            return Text(
              'Button pressed \$ {snapshot.data} times',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
        
          
          
          '''),
          const CodeView(code: '''
import 'dart:async';

Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1)); // Wait for 1 second
    yield i; // Emit the next number in the stream
  }
}

void main() async {
  await for (int value in countStream()) {
    print(value); // Print each value as it is emitted
  }
}
          
          
          
          '''),
          const NormalView(
            text: 'There are two types of stream.',
          ),
          const HeadingView(text: 'Single Subscription Stream'),
          const NormalView(text: 'A single-subscription stream allows only one listener at a time. Once a listener subscribes to this stream, no other listener can subscribe until the first one is cancelled.'),
          const NormalView(
              text: 'More than one StreamController is not Possible'),

          const CodeView(code: '''
Stream<int> singleStream() async* {
  yield 1;
  yield 2;
  yield 3;
}

void main() {
  final stream = singleStream();
  
  stream.listen((value) {
    print(value); // Prints 1, 2, 3
  });

// Adding another listener here would cause an error
}
          '''),
          const HeadingView(text: 'BroadCast Stream'),
          const NormalView(text: 'A broadcast stream allows multiple listeners to subscribe at any time. Each listener receives the same events from the stream.'),
          const NormalView(text: 'We can user more than one StreamController'),
          const CodeView(code: '''   
Stream<int> broadcastStream() {
  return Stream<int>.periodic(Duration(seconds: 1), (count) => count).asBroadcastStream();
}

void main() {
  final stream = broadcastStream();
  
  stream.listen((value) {
    print('Listener 1: \$value'); // Multiple listeners
  });

  stream.listen((value) {
    print('Listener 2: \$value'); // Both listeners receive the same data
  });
}    
          '''),


          const CodeView(code: '''
          
class StreamBuilderExample extends StatelessWidget {
  Stream<int> counterStream() {
  //Single subscription stream
    return Stream<int>.periodic(Duration(seconds: 1), (count) => count);
  //broadcast subscription stream
    return Stream<int>.periodic(Duration(seconds: 1), (count) => count).asBroadcastStream();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterStream(),
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Counter: \${snapshot.data}',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
    );
  }
          
          '''),
        ],
      ),
    );
  }
}
