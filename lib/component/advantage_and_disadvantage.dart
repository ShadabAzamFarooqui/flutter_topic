import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/highlight_view.dart';
import 'package:learning/component/normal_view.dart';

class AdvantageAndDisadvantage extends StatelessWidget {
  const AdvantageAndDisadvantage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Advantage and disadvantage',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Advantage and disadvantage'),
          HighlightView(text: 'Advantage'),
          NormalView(text: '''
1. Single Codebase for Multiple Platforms.
2. Hot Reload.
3. Customizable and Rich UI.
4. High Performance.
5. Strong Community and Growing Ecosystem.
6. Open-Source and Free.
7. Wide Range of Widgets.
8. Access to Native Features.
9. Strong Support from Google.
10. Consistent UI Across Platforms.
11. Custom Painting and Animation.
12. Efficient Development Process.
13. Growing Popularity and Job Market.
14. Comprehensive Documentation.
15. Integration with Existing Code.
16. Reactive Framework.
17. Access to Firebase Services.
18. Support for Internationalization.
19. Inbuilt Testing Support.
20. Access to Platform Channels for Native Code.
'''),
          HighlightView(text: 'Disadvantage'),
          NormalView(text: '''
1. Large App Size.
2. Limited Ecosystem for Web and Desktop.
3. Platform-Specific Features.
4. Immaturity of the Ecosystem.
5. Learning Curve for Dart.
6. Limited Third-Party Integrations.
7. Complexity in Handling Large Applications.
8. Lack of Native Look and Feel.
9. Limited Access to Platform-Specific APIs.
10. Dependency on Dart Language.
11. Slower Start-Up Time for Complex Apps.
12. Lack of Some Advanced UI Features.
13. Potential for Performance Bottlenecks.
14. Challenging to Implement Complex Navigation.
15. Relatively New Technology.
16. Potential Compatibility Issues with Older Devices.
17. Requires Continuous Learning and Adaptation.
18. Dependence on Google’s Long-Term Support.
19. Limited AR/VR Capabilities.
20. Possible Delays in Platform Updates.
          '''),
        ],
      ),

    );
  }
}
