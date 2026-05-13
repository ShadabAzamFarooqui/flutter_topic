import 'package:flutter/cupertino.dart';

class NormalView extends StatelessWidget {
  final String text;


  const NormalView({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
    );
  }
}
