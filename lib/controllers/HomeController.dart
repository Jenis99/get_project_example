import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  
  var total = "0".obs;

  
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  calculate()
  {
    var t = int.parse(num1.text.toString()) + int.parse(num2.text.toString());
    total(t.toString());
  }
}