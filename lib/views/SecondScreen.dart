import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_project_example/views/WidgetAnimationExample.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.to(WidgetAnimationExample());
          },
          child: Text("Widget Animation"),
        ),
      ),
    );
  }
}