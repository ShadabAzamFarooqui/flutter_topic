import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class StreamAdvantageOverCallback extends StatelessWidget {
  const StreamAdvantageOverCallback({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Stream v/s Callback',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Stream v/s Callback'),
          NormalView(text: 'Stream designed to handle a continuous flow of asynchronous process(multiple event) over the time.'),
          NormalView(text: 'Callback typically handle the single event or result at a time. If you need to manage the multiple event you would need to create the multiple callback.'),
          NormalView(text: 'Stream provide built-in error handling and built-in support for managing the different states (Like waiting, active, done etc).'),
          NormalView(text: 'Callback requires manual management for error handling and different state.'),
        ],
      ),
    );
  }
}
