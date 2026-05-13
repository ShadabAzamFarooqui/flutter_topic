import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class FutureVsStreamBuilderExample extends StatelessWidget {
  const FutureVsStreamBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'FutureBuilder v/s StreamBuilder',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'FutureBuilder v/s StreamBuilder'),
          NormalView(
              text:
                  'FutureBuilder worked with future which provide a single result a some point of time.'),
          NormalView(
              text:
                  'StreamBuilder worked with stream which can provide a continuous flow of the result over the time.'),
          NormalView(
              text: 'FutureBuilder rebuild only once the future complete.'),
          NormalView(
              text:
                  'StreamBuilder rebuilds each time a new value emitted by stream.'),
          NormalView(
              text:
                  'Use FutureBuilder when you need to handle one time asynchronous operation.'),
          NormalView(
              text:
                  'Use StreamBuilder when you need to handle series of asynchronous event or data.'),
          NormalView(
              text:
                  'FutureBuilder is best for one time data loading (fetching data from API).'),
          NormalView(
              text:
                  'StreamBuilder is best for real time data stream(real time chat message, sensor data).'),
        ],
      ),
    );
  }
}
