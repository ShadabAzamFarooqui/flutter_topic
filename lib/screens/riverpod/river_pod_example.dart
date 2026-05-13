import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_divider.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';
import 'package:learning/screens/riverpod/select_example.dart';
import 'package:learning/screens/riverpod/simple_provider_example.dart';
import 'package:learning/screens/riverpod/state_notifier_provider_example.dart';
import 'package:learning/screens/riverpod/state_provider_example.dart';
import 'package:learning/screens/riverpod/stream_provider_example.dart';

import '../../component/pointers_click_view.dart';
import '../../main.dart';
import 'async_notifier_provider_example.dart';
import 'auto_dispose_example.dart';
import 'family_example.dart';
import 'future_provider_example.dart';
import 'notifier_provider_example.dart';

class RiverPodExample extends StatelessWidget {
  const RiverPodExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'RiverPod Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Riverpod'),
          NormalView(
            text:
                '''Riverpod is a state management solution for Flutter created by Rémi Rousselet.
It is an improved and safer version of Provider that offers better dependency injection, state management, testability, and compile-time safety.''',
          ),

          HeadingView(text: 'Key Features of Riverpod'),
          NormalView(text: '=> Compile-time safe'),
          NormalView(text: '=> No dependency on BuildContext'),
          NormalView(text: '=> Better performance'),
          NormalView(text: '=> Easy testing'),
          NormalView(text: '=> Supports async state handling'),
          NormalView(text: '=> Dependency injection support'),
          NormalView(text: '=> Scalable for large applications'),

          HeadingView(text: 'Advantages'),
          NormalView(
            text: '''=> Better scalability
=> Cleaner code
=> Easy unit testing
=> Strong async support
=> Less boilerplate than BLoC
=> Better performance optimization''',
          ),
          HeadingView(text: 'Why Riverpod over Provider?'),
          PointersView(text: 'Provider has some limitations:'),
          NormalView(text: '=> BuildContext dependency'),
          NormalView(text: '=> ProviderNotFoundException'),
          NormalView(text: '=> Harder dependency management'),
          NormalView(text: '=> Difficult testing in some scenarios'),
          PointersView(text: 'Riverpod solves these issues by:'),
          NormalView(text: '=> Removing context dependency'),
          NormalView(text: '=> Providing global access to providers'),
          NormalView(text: '=> Better type safety'),
          NormalView(text: '=> Cleaner architecture support'),
          HeadingView(text: 'Types of Providers in Riverpod'),
          PointersClickView(
            text: 'Provider',
            onTap: () {
              pushName(context, SimpleProviderExample());
            },
            count: '1',
          ),

          PointersClickView(
            text: 'StateProvider',
            onTap: () {
              pushName(context, StateProviderExample());
            },
            count: '2',
          ),
          PointersClickView(
            text: 'FutureProvider',
            onTap: () {
              pushName(context, FutureProviderExample());
            },
            count: '3',
          ),

          PointersClickView(
            text: 'StreamProvider',
            onTap: () {
              pushName(context, StreamProviderExample());
            },
            count: '4',
          ),

          PointersClickView(
            text: 'StateNotifierProvider',
            count: '5',
            onTap: () {
              pushName(context, StateNotifierProviderExample());
            },
          ),

          PointersClickView(
            text: 'NotifierProvider',
            onTap: () {
              pushName(context, NotifierProviderExample());
            },
            count: '6',
          ),

          PointersClickView(
            text: 'AsyncNotifierProvider',
            onTap: () {
              pushName(context, AsyncNotifierProviderExample());
            },
            count: '7',
          ),

          HeadingView(text: 'Modifiers in Riverpod'),
          NormalView(
            text:
                'A modifier is an extra feature added to a provider to change or enhance its behavior.',
          ),
          PointersClickView(
            text: '.Family',
            count: '1',
            onTap: () {
              pushName(context, FamilyExample());
            },
          ),

          PointersClickView(
            text: '.Select',
            onTap: () {
              pushName(context, SelectExample());
            },
            count: '2',
          ),
          PointersClickView(
            text: '.AutoDispose',
            count: '3',
            onTap: () {
              pushName(context, AutoDisposeExample());
            },
          ),
          PointersView(text: 'USAGE: .select with .family and .autoDispose'),

          CustomDivider(),
          ReadWatchListenExplanation(),

          HeadingView(text: 'Consumer Widgets'),
          NormalView(
            text: 'Riverpod uses following widget to access providers.',
          ),
          CodeView(
            code: '''ConsumerWidget (in place of StatelessWidget)
Consumer
ConsumerStatefulWidget (in place of StatefulWidget)''',
          ),

          HeadingView(text: 'AsyncValue'),
          NormalView(
            text: 'FutureProvider and StreamProvider return AsyncValue.',
          ),
          NormalView(
            text: '''AsyncValue has three states:
=> loading
=> data
=> error''',
          ),

          CodeView(
            code: '''ref.watch(userProvider).when(
  data: (data) {},
  loading: () {},
  error: (e, s) {},
);''',
          ),
        ],
      ),
    );
  }
}

class ReadWatchListenExplanation extends StatelessWidget {
  const ReadWatchListenExplanation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingView(text: 'watch vs read vs listen'),
        NormalView(text: 'watch: Rebuilds UI when state changes.'),
        CodeView(code: '''ref.watch(counterProvider);'''),

        NormalView(text: 'read: Gets value once without rebuild.'),
        CodeView(code: '''ref.read(counterProvider);'''),

        NormalView(text: 'listen: Listens to changes for side effects.'),
        CodeView(code: '''ref.listen(counterProvider, (previous, next) {});'''),
      ],
    );
  }
}

class OpenButton extends StatelessWidget {
  final VoidCallback? onTap;

  const OpenButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Open', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
