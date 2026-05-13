import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class BestPracticeExample extends StatelessWidget {
  const BestPracticeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Best Practice Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Best Practice'),
          NormalView(
              text: 'Break your code into reusable and maintainable module.'),
          NormalView(text: 'Use proper directory to put the file in it.'),
          NormalView(text: 'Loose coupling.'),
          NormalView(text: 'Responsive design (Use Flexible And Expandable).'),
          NormalView(text: 'Lazy loading (Use ListView builder).'),
          NormalView(text: 'Use dependency injection.'),
          NormalView(text: 'Use caching for image loading (use cached_network_image.'),
          NormalView(text: 'Use const Constructor where possible.'),
          NormalView(text: 'Avoid unnecessary rebuilding the widget'),
          NormalView(text: 'Proper error handling (Use try catch block for risky code)'),
          NormalView(text: 'Code commenting'),
          NormalView(text: 'Set the limitation of code of method'),
          NormalView(text: 'Testing'),
          NormalView(text: 'Unit Testing (test package)'),
          NormalView(text: 'Widget Testing (flutter_test)'),
          NormalView(text: 'Integration Testing'),
        ],
      ),
    );
  }
}
