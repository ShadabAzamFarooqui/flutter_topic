import 'package:flutter/cupertino.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class HotReloadNHotRestartExample extends StatelessWidget {
  const HotReloadNHotRestartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Hot reload v/s Hot restart v/s Full Restart',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingView(text: 'Hot Reload'),
            NormalView(
                text:
                    'This is the easiest and fastest way which help us to apply the changes, bug fixes, creating UI.'),
            NormalView(text: 'It takes approx 1 second to perform.'),
            NormalView(
                text:
                    'It load the changes into running virtual machine and rebuild the widget tree.'),
            NormalView(text: 'It preserved the state.'),
            NormalView(text: 'It doesn`t run main or initState.'),
            HeadingView(text: 'Hot Restart'),
            NormalView(
                text:
                    'It load the changes into virtual machine and restart the flutter application.'),
            NormalView(text: 'It doesn`t preserved the state.'),
            HeadingView(text: 'Full Restart'),
            NormalView(
                text:
                    'It restart the OS(Android/iOS. Also restart DDC(dart development compiler)'),
          ],
        ));
  }
}
