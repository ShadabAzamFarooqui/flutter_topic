import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Provider',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Provider'),
          NormalView(
              text:
                  'Provider is a simple way for state management. It works on the concept of PUB-SUB, which means there is one provider and multiple subscriber which is called consumer here. Whenever there is a change with notifyChangeListener() it will update all the consumers.'),
          HeadingView(text: 'Single Provider'),
          CodeView(code: '''
          
ChangeNotifierProvider(
      create: (_) => StateClass(),                                                    
      child: MyApp(),
    ),
          
          '''),
          HeadingView(text: 'MultiProvider'),
          CodeView(code: '''
          
MultiProvider(
   providers: [
     ChangeNotifierProvider(create: (_) => StateClass1()),
     ChangeNotifierProvider(create: (_) => StateClass2()),
        
      ],
      child: MyApp(),
    ),
          
          '''),
          HeadingView(text: 'Selector'),
          NormalView(
              text:
                  'Rebuilds the widget only when a specific part of the data changes, using a selector function to extract that part.'),
          NormalView(
              text:
                  'Optimizes performance by minimizing rebuilds to only the parts of the data you care about.'),
          CodeView(code: '''
          
Selector<Counter, data_type>(
              selector: (context, counter) => stateClass.variable,
              builder: (context, value, child) {
                return Text('Counter value: \$value');
              },
            ),
          
          '''),
          HeadingView(text: 'Consumer'),
          NormalView(
              text:
                  'Rebuilds the widget whenever any part of the provided ChangeNotifier changes.'),
          NormalView(
              text:
                  'Useful when you need to rebuild the widget based on any change in the entire model.'),
          CodeView(code: '''
          
Consumer<Counter>(
              builder: (context, counter, child) {
                return Text('Counter value: \${counter.value}');
              },
            ),
          
          '''),
          NormalView(
              text:
                  'We can access the instance of Provider(State) Class as follows'),
          CodeView(code: '''
          
context.read<StateClass>()
Provider.of<Counter>(context)
context.watch<StateClass>()
Provider.of<Counter>(context, listen: true);                  

          
          '''),
        ],
      ),
    );
  }
}
