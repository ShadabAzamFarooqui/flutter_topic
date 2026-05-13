import 'package:flutter/material.dart';
import 'package:learning/component/pointers_view.dart';

class RealFlowView extends StatelessWidget {
  final String text;

  const RealFlowView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.withValues(alpha: 0.3),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PointersView(text: text),
      ),
    );
  }
}
