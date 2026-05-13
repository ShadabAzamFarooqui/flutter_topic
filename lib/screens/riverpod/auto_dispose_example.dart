import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';
import 'package:learning/component/pointers_view.dart';
import 'package:learning/component/real_flow_view.dart';

class AutoDisposeExample extends StatelessWidget {
  const AutoDisposeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '.autoDispose Modifier',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          HeadingView(text: '.autoDispose'),
          NormalView(
            text:
                'Used to destroy provider when screen closes.',
          ),

          CodeView(code: '''final productProvider =
    FutureProvider.autoDispose
        .family<Product, int>(
  (ref, productId) async {

    return api.getProduct(productId);
  },
);'''),

        ],
      ),
    );
  }
}
