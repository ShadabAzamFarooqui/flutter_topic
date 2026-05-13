import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';

import '../../component/code_view.dart';
import '../../component/heading_view.dart';
import '../../component/normal_view.dart';
import '../../component/real_flow_view.dart';

class SimpleProviderExample extends StatelessWidget {
  const SimpleProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Simple Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Provider'),
          NormalView(
            text:
            '''Provider is mainly used for dependency injection and read-only objects like repositories, services, API clients, Database, SharedPreferences and helpers.
These objects are created once and reused everywhere.''',
          ),
      
          SizedBox(height: 10),
          NormalView(text: 'Instead of creating instance directly,'),
          CodeView(
            code: '''
final api = ApiService();''',
          ),
          NormalView(text: 'We create provider for it and access it using ref.'),
      
          CodeView(
            code: '''final apiServiceProvider =
    Provider<ApiService>((ref) {

  return ApiService();
});''',
          ),
      
          NormalView(text: 'and access it using ref like this'),
          CodeView(code: '''final api = ref.read(apiServiceProvider);'''),
          NormalView(text: 'Sample API service class'),
          CodeView(
            code: '''
class ApiService {

  Future<String> getUser() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    return "Shadab";
  }
}''',
          ),
      
          HeadingView(text: 'Real Flow'),
      
          RealFlowView(
            text: '''UI
 ↓
Provider<ApiService>
 ↓
ApiService
 ↓
API Call''',
          ),
        ],
      ),
    );
  }
}
