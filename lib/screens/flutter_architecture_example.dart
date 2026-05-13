import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class FlutterArchitecture extends StatelessWidget {
  const FlutterArchitecture({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Flutter Architecture',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingView(text: 'Flutter Engine'),
            NormalView(
              text:
                  'Flutter engine is developed by SKIA. It`s a 2D open source graphic library used by flutter to render the UI component, It`s written in C++. It`s responsible to run the flutter.',
            ),
            HeadingView(text: 'Foundation Library'),
            NormalView(
                text:
                    'Its include all the required package, basic building block to develop the flutter application. These library(package) already developed in dart.'),
            HeadingView(text: 'Widget'),
            NormalView(
                text:
                    'Everything related to the user`s interaction is widget here. Eg: Text, Container etc.'),
            HeadingView(text: 'Design Specific Widget'),
            NormalView(
                text:
                    'Since we know that flutter is a cross application platform to develop the application for android, ios etc. It is also provide a way to write a different widget for all.'),
          ],
        ));
  }
}
