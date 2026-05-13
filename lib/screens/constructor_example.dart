import 'package:flutter/material.dart';
import 'package:learning/component/code_view.dart';
import 'package:learning/component/custom_scaffold.dart';
import 'package:learning/component/heading_view.dart';
import 'package:learning/component/normal_view.dart';

class ConstructorExample extends StatelessWidget {
  const ConstructorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Constructors',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingView(text: 'Default Constructor/Normal Constructor'),
          NormalView(text: 'It creates the new instance of the class.'),
          NormalView(text: 'The name should be same as class name'),
          CodeView(code: '''

class Person {
  final String name;
  final int age;

  // Normal constructor
  Person(this.name, this.age);
}

void main() {
  final person = Person('Alice', 30);
  print('Name: \${person.name}, Age: \${person.age}');
}
          
          '''),
          HeadingView(text: 'Named Constructor'),
          NormalView(
              text:
                  'A named constructor in Dart allows you to create multiple constructors with different names for a class.'),
          NormalView(
              text:
                  'This is additional constructor with different initialization logic.'),
          NormalView(text: 'I has a unique name after the class name'),
          NormalView(text: 'It create new instance but with specific logic'),
          CodeView(code: '''
class Person {
  final String name;
  final int age;

  // Default constructor
  Person(this.name, this.age);

  // Named constructor
  Person.young(String name) : this(name, 18);
}

void main() {
  final person1 = Person('Alice', 30);
  final person2 = Person.young('Bob');
  
  print('Person1: \${person1.name}, Age: \${person1.age}');
  print('Person2: \${person2.name}, Age: \${person2.age}');
}
'''),

          HeadingView(text: 'Factory Constructor'),
          NormalView(text: 'A factory constructor in Dart is a special type of constructor that can be used to return an instance of a class or a subclass. Unlike normal constructors, a factory constructor can return an existing instance, a new instance, or even a different type of instance altogether. It’s often used for implementing singleton patterns or caching instances.'),
          CodeView(code: '''


class Person {
  final String name;
  final int age;

  // Normal constructor
  Person(this.name, this.age);

  // Factory constructor
  factory Person.create(String name, int age) {
    // Singleton pattern for a specific name
    if (name == 'Alice') {
      return _singletonInstance;
    }
    
    // Create a new instance if age is less than 18
    if (age < 18) {
      return Teenager(name, age);
    }
    
    // Default case: create a new Person instance
    return Person(name, age);
  }

  // Singleton instance for 'Alice'
  static final Person _singletonInstance = Person('Alice', 30);

  @override
  String toString() => 'Person(name: \$name, age: \$age)';
}

class Teenager extends Person {
  Teenager(String name, int age) : super(name, age);

  @override
  String toString() => 'Teenager(name: \$name, age: \$age)';
}

void main() {
  final person1 = Person.create('Alice', 30); // Returns singleton instance
  final person2 = Person.create('Bob', 17);   // Returns a Teenager instance
  final person3 = Person.create('Charlie', 25); // Returns a new Person instance

  print(person1); // Output: Person(name: Alice, age: 30)
  print(person2); // Output: Teenager(name: Bob, age: 17)
  print(person3); // Output: Person(name: Charlie, age: 25)
}




          
          '''),


          NormalView(text: 'Code 2'),
          CodeView(code: '''
          
abstract class Shape {
  String get type;
  
  factory Shape(String shapeType) {
    if (shapeType == 'circle') {
      return Circle();
    } else if (shapeType == 'rectangle') {
      return Rectangle();
    } else {
      throw ArgumentError('Unknown shape type');
    }
  }

  @override
  String toString() => 'Shape(type: \$type)';
}

class Circle implements Shape {
  @override
  String get type => 'circle';
}

class Rectangle implements Shape {
  @override
  String get type => 'rectangle';
}

void main() {
  final shape1 = Shape('circle');
  final shape2 = Shape('rectangle');

  print(shape1); // Output: Shape(type: circle)
  print(shape2); // Output: Shape(type: rectangle)
}

          
          '''),
        ],
      ),
    );
  }
}
