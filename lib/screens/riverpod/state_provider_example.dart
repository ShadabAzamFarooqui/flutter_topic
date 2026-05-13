import 'package:flutter/material.dart';

import '../../component/code_view.dart';
import '../../component/custom_scaffold.dart';
import '../../component/heading_view.dart';
import '../../component/normal_view.dart';
import '../../component/real_flow_view.dart';
class StateProviderExample extends StatelessWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'State Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'StateProvider'),
          NormalView(
            text:
            'StateProvider is used for small and simple mutable UI states like toggle, checkbox, counter, selected tab, or password visibility.',
          ),
          CodeView(
            code: '''final passwordVisibilityProvider =
    StateProvider<bool>((ref) => true);''',
          ),
          NormalView(text: 'Watch State (UI Usage)'),
          CodeView(
            code: '''final isHidden = ref.watch(passwordVisibilityProvider);''',
          ),
          NormalView(text: 'Update State'),
          CodeView(
            code:
            '''ref.read(passwordVisibilityProvider.notifier).state = !isHidden;''',
          ),

          HeadingView(text: 'Real Flow'),

          RealFlowView(
            text: '''UI Click
 ↓
StateProvider state changes
 ↓
UI rebuild automatically''',
          ),
        ],
      ),
    );
  }
}
