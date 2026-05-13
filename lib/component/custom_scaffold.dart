import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? child;
  final String? title;

  const CustomScaffold({super.key, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'title'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: child ?? Container(),
                      ),
              ))),
    );
  }
}
