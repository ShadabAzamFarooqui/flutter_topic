import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';

import '../../component/custom_scaffold.dart';

class NotifierProviderExample extends StatelessWidget {
  const NotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Notifier Provider Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'NotifierProvider'),
          NormalView(
            text:
                'NotifierProvider works similarly to StateNotifierProvider, but it uses the build() method instead of constructors and super(), making the code cleaner and reducing boilerplate.',
          ),
          SizedBox(height: 6),
          NormalView(
            text:
                'NotifierProvider is the modern replacement for StateNotifierProvider and is used for synchronous complex state management with cleaner syntax and less boilerplate.',
          ),
          SizedBox(height: 6),
          NormalView(
            text:
                'In real-world applications like employee management, cart systems, or dashboard modules, NotifierProvider is preferred because it centralizes business logic inside a Notifier class, provides cleaner and more scalable state management, separates UI from state handling, and makes managing loading, error, and data states easier and more maintainable.',
          ),
          SizedBox(height: 10),

          PointersView(text: '1. OLD StateNotifier'),

          CodeView(
            code: '''
class EmployeeNotifier extends StateNotifier<EmployeeState> {

  final ApiService apiService;

  EmployeeNotifier(this.apiService)
  : super(
          EmployeeState(
            isLoading: false,
            employees: [],
          ),
        );
}''',
          ),
          PointersView(text: '2. NEW Notifier'),
          CodeView(
            code: '''
class EmployeeNotifier extends Notifier<EmployeeState> {

  late final ApiService apiService;

  @override
  EmployeeState build() {

    apiService =
        ref.read(apiServiceProvider);

    return EmployeeState(
      isLoading: false,
      employees: [],
    );
  }
}''',
          ),
          PointersView(text: '3. OLD Provider'),
          CodeView(
            code: '''
final employeeProvider = StateNotifierProvider<EmployeeNotifier,EmployeeState>((ref) {

  final apiService = ref.read(apiServiceProvider);

  return EmployeeNotifier(
    apiService,
  );
});''',
          ),

          PointersView(text: '4. NEW Provider'),
          CodeView(
            code: '''
final employeeProvider = NotifierProvider<EmployeeNotifier,EmployeeState>(
  EmployeeNotifier.new,
);''',
          ),

          PointersView(text: 'Main Difference'),
          CodeView(
            code: '''
StateNotifierProvider uses constructors and super(initialState) for initializing state, and dependencies are usually passed through the constructor, which results in more boilerplate code.''',
          ),
          CodeView(
            code: '''
On the other hand, NotifierProvider uses the build() method to initialize state, dependencies can be accessed directly using ref, and overall it provides cleaner syntax with less boilerplate.''',
          ),
        ],
      ),
    );
  }
}
