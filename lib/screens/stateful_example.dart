import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class StateFulExample extends StatelessWidget {
  const StateFulExample({super.key});

  @override
  Widget build(BuildContext context) {
    String createState = '''
 @override
  State<Dummy> createState() => _DummyState();
    ''';
    return CustomScaffold(
        title: 'Stateful widget Lifecycle',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //createState
            const HeadingView(text: 'createState():'),
            const NormalView(
                text:
                    'This method is responsible to create the state of the widget.'),
            const NormalView(
                text:
                    'This method is called when state full widget first inserted in to widget tree.'),
            const NormalView(
                text:
                    'It return the state of the state class associated with the widget.'),

            CodeView(code: createState),

            // initState
            const HeadingView(
              text: 'initState():',
            ),
            const SizedBox(
              height: 2,
            ),
            const NormalView(
              text:
                  'This method is called once when state of the widget is created. ',
            ),
            const NormalView(
              text:
                  'This is used to initialize the object, subscribe the stream, or other one time setup task.',
            ),

            const CodeView(
              code: '''
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    ''',
            ),

            const CodeView(
              code: 'mounted=true',
            ),

            const HeadingView(text: 'didChangeDependencies():'),
            const NormalView(
                text: 'It is called immediately after the initState.'),
            const NormalView(
                text:
                    'It is called when the dependency of the widget is changed.'),
            const NormalView(
                text:
                    'It is also called when the widget\'s position in the Tree is changed.'),
            const SizedBox(
              height: 10,
            ),
            const NormalView(
              text: 'Eg: ListView item position changes.',
            ),

            const CodeView(code: '''
     @override
     void didChangeDependencies() {
          super.didChangeDependencies();
    }'''),
            const SizedBox(
              height: 10,
            ),
            const HeadingView(text: 'build():'),
            const NormalView(
                text:
                    'This method contain the BuildContext in the parameter. This is responsible to return the widget. '),

            const CodeView(code: '''
@override
Widget build(BuildContext context) {
       return Container(
           child: Text('Hello World'),
       );
   }
              '''),
            const HeadingView(text: 'didUpdateWidget():'),
            const NormalView(
                text:
                    'This is called when the parent widget has changed and has to rebuild the widget.'),
            const NormalView(
                text:
                    'This method is called whenever the widget\'s configuration changes. It provides an opportunity to respond to changes in the widget\'s properties.'),
            const CodeView(code: '''
 @override
  void didUpdateWidget(MyWidget oldWidget) {
          super.didUpdateWidget(oldWidget);
         // Respond to widget property changes.
      }
              '''),

            const HeadingView(text: 'setState():'),
            const NormalView(text: 'This is used to rebuild the widget tree.'),
            const CodeView(code: ''' setState(() {
                                                                                                
                });'''),
            const HeadingView(text: 'deactivate():'),
            const NormalView(
                text:
                    'It is called when the state is removed from the tree but might be reinserted before the current frame changes.'),
            const NormalView(
                text:
                    'It is called when a widget removed from widget tree but might be inserted later.'),
            const NormalView(
                text:
                    'It is called whenever the widget is removed temporarily during the parent widget rebuild that might reinserted the child.'),
            const NormalView(
                text:
                    'Eg: Bottom Navigation Item changes. PageView or any toggle widget.'),
            const CodeView(code: '''
     @override
      void deactivate() {                                                                                                     
              super.deactivate();
      }'''),
            const HeadingView(text: 'dispose():'),

            const NormalView(
                text:
                    'It is called when the widget is parmanently removed from tree and won\'t be reinserted'),
            const NormalView(
                text:
                    'it is used for releasing the resources, closing the controller, stream or other listeners'),
            const CodeView(code: '''
      @override
      void dispose() {
        super.dispose();                                                                
      }'''),
            const CodeView(
              code: 'mounted=false',
            ),
          ],
        ));
  }
}
