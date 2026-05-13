import 'package:flutter/material.dart';
import 'package:learning/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Topics'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: topics.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            onTap(context, index);
          },
          child: Container(
            color: (index == 0 || index % 2 == 0)
                ? Colors.white
                : const Color(0xFFf2f7f4),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${index + 1}. ${topics[index].name}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  topics[index].isDone
                      ? const Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.check),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void pushName(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
