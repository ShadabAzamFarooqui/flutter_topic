import 'package:flutter/material.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/highlight_view.dart';
import 'package:learning/component/normal_view.dart';

class DesignPatternExample extends StatelessWidget {
  const DesignPatternExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Design Pattern',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'MVC(Model View Controller)'),
          HighlightView(text: 'Model:'),
          NormalView(
              text:
                  'Model Represent the data and business logic of the application. Model manage the data, perform the operation and notifies the controller about their changes.'),
          HighlightView(text: 'View:'),
          NormalView(
              text:
                  'View present the data to user and handle user interactions.'),
          NormalView(
              text: 'View display the data and receive input from user.'),
          NormalView(text: 'View communicate user action to controller.'),
          HighlightView(text: 'Controller:'),
          NormalView(
              text:
                  'Controller act as an intermediary between model and view.'),
          NormalView(
              text:
                  'It receive input from view and process it (often updating the model) and then update the view.'),
          NormalView(
              text:
                  'Controller handle logic and update the view manually when changes occured in model.'),
          SizedBox(
            height: 10,
          ),
          HighlightView(text: '~ User interact with view.'),
          HighlightView(text: '~ View send user action to controller.'),
          HighlightView(text: '~ Controller update the model based on input.'),
          HighlightView(
              text: '~ Model may notify to the controller of changes.'),
          HighlightView(text: '~ Controller update the view.'),
          HeadingView(text: 'MVVM(Model View ViewModel)'),
          HighlightView(text: 'Model:'),
          NormalView(
              text:
                  'Model Represent the date and business logic of the application.'),
          NormalView(
              text:
                  'Model manage the data and rules and notify ViewModel about data changes'),
          HighlightView(text: 'View:'),
          NormalView(
              text:
                  'View display the user interface and bind to the ViewModel.'),
          NormalView(
              text:
                  'View shows data from ViewModel and handle the user interaction.'),
          NormalView(
              text:
                  'It reacts to the changes in the ViewModel through data binding'),
          HighlightView(text: 'ViewModel:'),
          NormalView(text: 'ViewModel act as an intermediary between view and model.'),
          NormalView(text: 'ViewModel expose the data and command to the view.'),
          NormalView(text: 'It process the user input, interact with ViewModel and provide data to the view and notify to the view of the changes through data binding mechanism.'),
          HighlightView(text: '~ User interact with view'),
          HighlightView(text: '~ View binds to the ViewModel, which provide the data and command'),
          HighlightView(text: '~ ViewModel update the model based on user interaction.'),
          HighlightView(text: '~ Model update the ViewModel when data changes.'),
          HighlightView(text: '~ View automatically updated when ViewModel changes.'),
          HeadingView(text: 'MVC v/s MVVM'),
          HighlightView(text: 'MVC'),
          NormalView(text: 'Controller manage the interaction between view and model.'),
          NormalView(text: 'The view often need to be manually update when model changes.'),
          NormalView(text: 'Direct interaction between view and model.'),
          NormalView(text: 'Requires manual intervention to update the view when model change.'),
          HighlightView(text: 'MVVM'),
          NormalView(text: 'ViewModel expose the data and command to the view through data binding.'),
          NormalView(text: 'The view automatically updates when changes occurred in ViewModel.'),
          NormalView(text: 'Provide data binding between view and model that enable automatic updates.'),

        ],
      ),
    );
  }
}
