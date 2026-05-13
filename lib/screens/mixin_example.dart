import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class MixinExample extends StatelessWidget {
  const MixinExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Mixin',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingView(text: 'mixin'),
            NormalView(
                text:
                    '\'mixin\' is same as class but no constructor. It allows the code re-usability.'),
            NormalView(
                text:
                    'Its provide the re-usable set of method or properties that can be mixed into other classes'),
            NormalView(
                text:
                    'Mixin does not have their own instance, means we can\'t create object directly'),
            CodeView(code: '''
            
mixin A{
    void printSomething(){
        print('in A');
    }                                                                                      
}


mixin B{
    void printSomething(){
        print('in B');
    }                                                                                      
}

class Test with A, with B{
  printSomething();
}   


OUTPUT: in B
            '''),
          ],
        ));
  }
}
