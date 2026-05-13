import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class TopLevelFunctionExample extends StatelessWidget {
  const TopLevelFunctionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Top-Level Function',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingView(text: 'Top-Level Function'),
            NormalView(
                text:
                    'Its a regular function define out side of any class or mix or extensions. Its not tied up with any specific object'),
            NormalView(
                text:
                    'Its come in used when you need a standalone function that does not belong to any specify class.'),
            CodeView(code: '''
Eg:

  dateFormatter() function
  amountFormatter()                                                                               
  currencyFormatter() 
  '''),
          ],
        ));
  }
}
