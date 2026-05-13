import 'package:flutter/material.dart';

import '../../component/code_view.dart';
import '../../component/custom_scaffold.dart';
import '../../component/heading_view.dart';
import '../../component/normal_view.dart';
import '../../component/pointers_view.dart';
import '../../component/real_flow_view.dart';
class FutureProviderExample extends StatelessWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Future Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'FutureProvider'),
          NormalView(
            text:
            'FutureProvider is used for handling asynchronous data like API calls], database queries, or any future-based operations. It automatically manages loading and error states.',
          ),
          SizedBox(height: 10),
          PointersView(text: 'Provider'),
          CodeView(
            code: '''
final profileProvider = FutureProvider<String>((ref) async {

  final api =
      ref.read(apiServiceProvider);

  return api.getProfile();
});''',
          ),

          PointersView(text: '''UI Usage'''),
          CodeView(
            code: '''
ref.watch(profileProvider).when(

  data: (data) {

    return Text(data);
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
            text: '''Screen Open
 ↓
FutureProvider starts API call
 ↓
loading state
 ↓
success/error
 ↓
UI rebuild''',
          ),
        ],
      ),
    );
  }
}
