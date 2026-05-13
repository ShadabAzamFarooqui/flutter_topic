import 'package:flutter/material.dart';

import '../../component/code_view.dart';
import '../../component/custom_scaffold.dart';
import '../../component/heading_view.dart';
import '../../component/normal_view.dart';
import '../../component/pointers_view.dart';
import '../../component/real_flow_view.dart';

class StreamProviderExample extends StatelessWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Stream Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'StreamProvider'),
          NormalView(
            text:
                'StreamProvider is used for realtime or continuously changing data like Firebase, chat systems, or websocket updates.',
          ),
          SizedBox(height: 10),
          PointersView(text: 'ApiService'),

          CodeView(
            code: '''class ApiService {

  Stream<int> timerStream() async* {

    for (int i = 1; i <= 100; i++) {

      await Future.delayed(
        const Duration(seconds: 1),
      );

      yield i;
    }
  }
}''',
          ),

          PointersView(text: '''Provider'''),

          CodeView(
            code: '''final timerProvider =
    StreamProvider<int>((ref) {

  final api =
      ref.read(apiServiceProvider);

  return api.timerStream();
});''',
          ),
          PointersView(text: '''UI Usage'''),
          CodeView(
            code: '''ref.watch(timerProvider).when(

  data: (data) {

    return Text("\$data");
  },

  loading: () {

    return CircularProgressIndicator();
  },

  error: (e, s) {

    return Text("Error");
  },
);''',
          ),

          RealFlowView(
            text: '''Stream emits new value
 ↓
Provider receives update
 ↓
UI rebuild automatically''',
          ),
        ],
      ),
    );
  }
}
