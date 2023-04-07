import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactView extends StatelessWidget
{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()
            {
              Get.back();
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }

}