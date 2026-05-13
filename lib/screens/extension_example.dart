import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class ExtensionExample extends StatelessWidget {
  const ExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Extensions',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Extensions'),
          NormalView(
              text:
                  'Extensions allows us to add the functionality to the existing class without modifying them'),
          CodeView(code: '''
          
extension StringReversal on String {
  String get reversed {
    return this.split('').reversed.join('');
  }
}
          
          '''),
          CodeView(code: '''
          
void main() {
  final originalString = "Flutter";
  final reversedString = originalString.reversed;

  print('Original String: \$originalString');  // Output: Flutter
  print('Reversed String: \$reversedString');  // Output: rettulF
}
          ''')
        ],
      ),
    );
  }
}
