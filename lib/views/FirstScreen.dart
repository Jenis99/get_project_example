import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_project_example/views/SecondScreen.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        ),
        body: Center(child: ElevatedButton(
          onPressed: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom,duration: Duration(seconds: 1), child: SecondScreen()));
        },
        child: Text("Go to Second"),)),
    );
  }
}