// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Person {
  final String name;
  final int age;
  final String imoji;
  Person({
    required this.name,
    required this.age,
    required this.imoji,
  });
}

final people = [
  Person(name: 'John', age: 20, imoji: '🤷'),
  Person(name: 'Jane', age: 21, imoji: '🧒'),
  Person(name: 'Jack', age: 22, imoji: '🧝'),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('People'),
            backgroundColor: const Color.fromARGB(255, 10, 1, 1)),
        backgroundColor: const Color.fromARGB(255, 10, 1, 1),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                        age: person.age,
                        name: person.name,
                        imoji: person.imoji),
                  ),
                );
              },
              leading: Material(
                color: Colors.white,
                child: Hero(
                  tag: person.imoji,
                  child: Text(
                    person.imoji,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
              ),
              title: Text(person.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              subtitle: Text('${person.age} years old',
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.white),
            );
          },
        ));
  }
}

class DetailsPage extends StatelessWidget {
  String name;
  int age;
  String imoji;
  DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.imoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.8),
        appBar: AppBar(
          centerTitle: true,
          title: Hero(
              flightShuttleBuilder:
                  (context, animation, direction, fromContext, toContext) {
                return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                        scale: animation.drive(
                      Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(curve: Curves.fastOutSlowIn),
                      ),
                    ))
                    // Text(
                    //   '🔥',
                    //   style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.white),
                    // ),
                    );
              },
              tag: imoji,
              child: Material(
                  color: Colors.transparent,
                  child: Text(imoji, style: const TextStyle(fontSize: 40)))),
          backgroundColor: const Color.fromARGB(255, 10, 1, 1),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('$age years old',
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
        ));
  }
}
