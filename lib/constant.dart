import 'package:flutter/cupertino.dart';
import 'package:learning/component/best_practice_example.dart';
import 'package:learning/component/future_vs_stream_builder_Example.dart';
import 'package:learning/component/getx_example.dart';
import 'package:learning/main.dart';
import 'package:learning/screens/FutureBuilderExample.dart';
import 'package:learning/screens/StreamExample.dart';
import 'package:learning/screens/build_context_example.dart';
import 'package:learning/screens/constructor_example.dart';
import 'package:learning/screens/extension_example.dart';
import 'package:learning/screens/firebase_push_notification_example.dart';
import 'package:learning/screens/flutter_architecture_example.dart';
import 'package:learning/screens/hot_reload_and_restart_example.dart';
import 'package:learning/screens/inherited_widget_example.dart';
import 'package:learning/screens/mixin_example.dart';
import 'package:learning/screens/provider_example.dart';
import 'package:learning/screens/top_level_function_example.dart';

import 'component/advantage_and_disadvantage.dart';
import 'component/design_pattern_example.dart';
import 'component/main_vs_run_example.dart';
import 'component/stream_advantage_over_callback_example.dart';
import 'screens/riverpod/river_pod_example.dart';
import 'screens/stateful_example.dart';

double screenWidth = 0.0;

class TopicModel {
  final String id;
  final String name;
  final bool isDone;

  TopicModel({required this.id, required this.name, required this.isDone});
}

List<TopicModel> topics = [
  TopicModel(
    isDone: true,
    id: 'advantage_and_disadvantage',
    name: 'Advantage and disadvantage of flutter',
  ),
  TopicModel(isDone: false, id: 'oops', name: 'OOPS'),
  TopicModel(isDone: true, id: 'state_ful', name: 'Stateful widget'),
  TopicModel(
    isDone: true,
    id: 'build_context',
    name: 'BuildContext/async/await',
  ),
  TopicModel(isDone: true, id: 'inherited_widget', name: 'InheritedWidget'),
  TopicModel(isDone: true, id: 'architecture', name: 'Flutter Architecture'),
  TopicModel(
    isDone: true,
    id: 'hot',
    name: 'Hot reload/Hot Restart/Full Restart',
  ),
  TopicModel(isDone: true, id: 'future_builder', name: 'Future Builder'),
  TopicModel(isDone: true, id: 'stream', name: 'Stream'),
  TopicModel(isDone: true, id: 'mixin', name: 'Mixin'),
  TopicModel(
    isDone: true,
    id: 'top_level_function',
    name: 'Top-Level Function',
  ),
  TopicModel(isDone: true, id: 'extensions', name: 'Extensions'),
  TopicModel(isDone: true, id: 'constructor', name: 'Constructor'),
  TopicModel(isDone: true, id: 'provider', name: 'Provider'),
  TopicModel(isDone: true, id: 'getx', name: 'GetX'),
  TopicModel(isDone: true, id: 'best_practice', name: 'Best Practice'),
  TopicModel(
    isDone: true,
    id: 'design_pattern',
    name: 'Design Pattern (MVC/MVVM)',
  ),
  TopicModel(
    isDone: true,
    id: 'future_vs_stream',
    name: 'FutureBuilder v/s StreamBuilder',
  ),
  TopicModel(isDone: true, id: 'push', name: 'Firebase push notification'),
  TopicModel(
    isDone: true,
    id: 'stream_over_callback',
    name: 'Advantage of stream over callback',
  ),
  TopicModel(
    isDone: false,
    id: '',
    name:
        'Long time running operation in background(Method Channel/Event Channel)',
  ),
  TopicModel(isDone: false, id: '', name: 'Localization'),
  TopicModel(isDone: false, id: '', name: 'Landscape/Portrait'),
  TopicModel(isDone: true, id: 'main_vs_run', name: 'main v/s runApp'),
  TopicModel(isDone: false, id: '', name: 'Animation(Twin animation)'),
  TopicModel(isDone: false, id: '', name: 'Action Event'),
  TopicModel(isDone: false, id: '', name: 'Build Mode'),
  TopicModel(isDone: false, id: '', name: 'Profiler (Memory leak)'),
  TopicModel(isDone: false, id: '', name: 'CI/CD'),
  TopicModel(isDone: false, id: '', name: 'Deal with different size of screen'),
  TopicModel(isDone: false, id: '', name: 'GRC(Datatype allocation)'),
  TopicModel(isDone: false, id: '', name: 'Memory Management'),
  TopicModel(isDone: true, id: 'riverpod', name: 'Riverpod'),
];

Future<void> onTap(BuildContext context, int index) async {
  if (topics[index].id == 'state_ful') {
    pushName(context, const StateFulExample());
  }
  if (topics[index].id == 'inherited_widget') {
    pushName(context, const InheritedWidgetExample());
  }
  if (topics[index].id == 'build_context') {
    pushName(context, const BuildContextExample());
  }

  if (topics[index].id == 'architecture') {
    pushName(context, const FlutterArchitecture());
  }
  if (topics[index].id == 'hot') {
    pushName(context, const HotReloadNHotRestartExample());
  }
  if (topics[index].id == 'future_builder') {
    pushName(context, const FutureBuilderExample());
  }
  if (topics[index].id == 'mixin') {
    pushName(context, const MixinExample());
  }
  if (topics[index].id == 'top_level_function') {
    pushName(context, const TopLevelFunctionExample());
  }
  if (topics[index].id == 'extensions') {
    pushName(context, const ExtensionExample());
  }
  if (topics[index].id == 'constructor') {
    pushName(context, const ConstructorExample());
  }
  if (topics[index].id == 'stream') {
    pushName(context, const StreamExample());
  }
  if (topics[index].id == 'provider') {
    pushName(context, const ProviderExample());
  }
  if (topics[index].id == 'push') {
    pushName(context, const FirebasePushNotificationExample());
  }
  if (topics[index].id == 'best_practice') {
    pushName(context, const BestPracticeExample());
  }
  if (topics[index].id == 'getx') {
    pushName(context, const GetXExample());
  }
  if (topics[index].id == 'future_vs_stream') {
    pushName(context, const FutureVsStreamBuilderExample());
  }
  if (topics[index].id == 'design_pattern') {
    pushName(context, const DesignPatternExample());
  }
  if (topics[index].id == 'stream_over_callback') {
    pushName(context, const StreamAdvantageOverCallback());
  }
  if (topics[index].id == 'main_vs_run') {
    pushName(context, const MainVsRunExample());
  }
  if (topics[index].id == 'advantage_and_disadvantage') {
    pushName(context, const AdvantageAndDisadvantage());
  }
  if (topics[index].id == 'riverpod') {
    pushName(context, const RiverPodExample());
  }
}
