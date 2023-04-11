import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WidgetAnimationExample extends StatefulWidget {
  const WidgetAnimationExample({super.key});

  @override
  State<WidgetAnimationExample> createState() => _WidgetAnimationExampleState();
}

class _WidgetAnimationExampleState extends State<WidgetAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Widget Animation") ,),
        body: Column(
          children: [
            
          ],
        ),
    );
  }
}