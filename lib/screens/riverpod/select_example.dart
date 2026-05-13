import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';

class SelectExample extends StatelessWidget {
  const SelectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '.select Modifier',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: '.select'),
          NormalView(text: 'Select watches only specific field.'),
          NormalView(
            text:
                'Select is useful when you want to watch only specific field of provider state. It helps to avoid unnecessary rebuilds when other fields of state changes.',
          ),

          CodeView(
            code: '''final name =
    ref.watch(

      userProvider.select(
        (state) => state.name,
      ),
    );''',
          ),
          CodeView(
            code: '''final isLoading =
    ref.watch(

      employeeProvider.select(
        (state) => state.isLoading,
      ),
    );''',
          ),

          PointersView(text: 'select with consumer widget:'),
          CodeView(
            code: '''Consumer(

  builder: (
    context,ref, child,) {

    final itemCount =

        ref.watch(

          cartProvider.select(
            (state) =>
                state.cartItems.length,
          ),
        );

    print("Cart Badge Rebuilt");

    return CircleAvatar(

      child: Text(
        itemCount.toString(),
      ),
    );
  },
)''',
          ),

          NormalView(
            text:
                'here when the cartItems length changes, only the CircleAvatar widget will rebuild instead of entire Consumer widget.',
          ),
        ],
      ),
    );
  }
}
