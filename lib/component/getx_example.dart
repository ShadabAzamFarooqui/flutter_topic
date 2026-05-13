import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/highlight_view.dart';
import 'package:learning/component/normal_view.dart';

class GetXExample extends StatelessWidget {
  const GetXExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'GetX Example',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'GetX'),
          NormalView(
              text:
                  'GetX is a powerful, lightweight, and fast state management library for Flutter that provides a complete solution for managing state, dependencies, and routes in your application.'),
          HighlightView(text: 'State Management:'),
          NormalView(
              text:
                  'GetX offers a reactive approach to state management. It makes it easy to update UI components when the state changes, without needing complex and verbose code. It uses GetBuilder for simple state management and Obx/GetX for more advanced reactive state updates.'),
          HighlightView(text: 'Dependency Injection'),
          NormalView(
              text:
                  'GetX provides an easy way to manage dependencies using dependency injection. With GetX, you can easily manage the lifecycle of controllers, services, and other classes, ensuring that they are only created when needed and disposed of properly.'),
          HighlightView(text: 'Routing'),
          NormalView(
              text:
                  'GetX simplifies navigation and routing in Flutter. It provides a Get.to, Get.back, and Get.off methods for navigation, making it easier to manage routes without needing a context. GetX also supports named routes and can handle nested navigators.'),
          HighlightView(text: 'Translations'),
          NormalView(
              text:
                  'GetX has built-in support for internationalization (i18n) and localization, allowing you to easily manage and switch between multiple languages in your app.'),
          HighlightView(text: 'Efficient'),
          NormalView(
              text:
                  'GetX is highly optimized and has minimal impact on app performance. It avoids unnecessary widget rebuilds, leading to better performance in complex applications.'),
          HighlightView(text: 'Ease of Use'),
          NormalView(
              text:
                  'GetX is known for its simplicity and developer-friendly API. It reduces boilerplate code, making it easier and faster to develop Flutter apps.'),
          HighlightView(text: '1. Setup the Project'),
          CodeView(code: '''
dependencies:
  flutter:
    sdk: flutter                                                                                                                  
  get:
          '''),
          HighlightView(text: '2. Create the Controller'),
          CodeView(code: '''
import 'package:get/get.dart';

class CounterController extends GetxController {
  // Reactive variable
  var counter = 0.obs;

  // Method to increment the counter
  void increment() {
    counter++;
  }
}

          '''),
          HighlightView(text: '3. Create a Binding'),
          CodeView(code: '''
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy loading the controller
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
          '''),
          HighlightView(text: '4. Create the UI'),
          CodeView(code: '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the controller
    final CounterController counterController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("GetX Counter")),
      body: Center(
        child: Obx(() {
          return Text(
            "Counter: \${counterController.counter}",
            style: TextStyle(fontSize: 24),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}

          '''),
          HighlightView(text: '5. Set Up Navigation and Binding'),
          CodeView(code: '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_binding.dart';
import 'counter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => CounterPage(),
          binding: CounterBinding(),
        ),
      ],
    );
  }
}

          '''),
        ],
      ),
    );
  }
}
