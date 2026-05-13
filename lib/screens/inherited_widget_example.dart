import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class InheritedWidgetExample extends StatelessWidget {
  const InheritedWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'InheritedWidget',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'InheritedWidget:'),
          NormalView(
              text:
                  'It’s a special type of widget that allows us to propagate the data down the widget tree without passing manually through constructor.'),
          NormalView(
              text:
                  'It will automatically rebuild the child whenever their dependant data has changed.'),
          NormalView(
              text:
                  'It ensure that only effected widget would be rebuild.'),
          NormalView(text: 'It optimise the performance. '),
          CodeView(code: '''import 'package:flutter/material.dart';
            
            class CounterInherited extends InheritedWidget {
      final int counter;
      final Function() increment;
            
      const CounterInherited({
        Key? key,
        required this.counter,
        required this.increment,
        required Widget child,
      }) : super(key: key, child: child);
            
      static CounterInherited? of(BuildContext context) { 
      return 
        context.
            dependOnInheritedWidgetOfExactType
      <CounterInherited>();
      }
            
      @override
      bool updateShouldNotify(covariant CounterInherited oldWidget) {
      return oldWidget.counter != counter;
      }
            }
            '''),
          NormalView(text: 'We can access the instance by using'),
          CodeView(
              code: '''final counterInherited = CounterInherited.of(context)
          '''),
          NormalView(text: '1. Create the InheritedWidget:'),
          CodeView(code: '''class CounterProvider extends StatefulWidget {
      final Widget child;
            
      const CounterProvider({Key? key, required this.child}) : super(key: key);
            
      @override
      _CounterProviderState createState() => _CounterProviderState();
            }
            
            class _CounterProviderState extends State<CounterProvider> {
      int _counter = 0;
            
      void _incrementCounter() {
        setState(() {
          _counter++;
        });
      }
            
      @override
      Widget build(BuildContext context) {
        return CounterInherited(
          counter: _counter,
          increment: _incrementCounter,
          child: widget.child,
        );
      }
            }
            '''),
          NormalView(
              text: '2. Create a Stateful Widget to Manage the Counter:'),
          CodeView(code: '''class CounterProvider extends StatefulWidget {
      final Widget child;
            
      const CounterProvider({Key? key, required this.child}) : super(key: key);
            
      @override
      _CounterProviderState createState() => _CounterProviderState();
            }
            
            class _CounterProviderState extends State<CounterProvider> {
      int _counter = 0;
            
      void _incrementCounter() {
        setState(() {
          _counter++;
        });
      }
            
      @override
      Widget build(BuildContext context) {
        return CounterInherited(
          counter: _counter,
          increment: _incrementCounter,
          child: widget.child,
        );
      }
            }
            '''),
          NormalView(
              text: '3. Use the InheritedWidget in Your Widget Tree:'),
          CodeView(code: '''void main() {
      runApp(MyApp());
            }
            
            class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return CounterProvider(
          child: MaterialApp(
            home: MyHomePage(),
          ),
        );
      }
            }
            '''),
        ],
      ),
    );
  }
}
