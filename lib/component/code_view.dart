import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:learning/constant.dart';

class CodeView extends StatelessWidget {
  final String code;

  const CodeView({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: HighlightView(
          code,
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: const TextStyle(
            fontFamily: 'Consolas',
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
