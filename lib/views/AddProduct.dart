import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_project_example/controllers/ProductController.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController c = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            TextField(
              controller: c.pname,
              keyboardType:TextInputType.text ,
            ),
            TextField(
              controller: c.qty,
              keyboardType:TextInputType.number ,
            ),
            TextField(
              controller: c.price,
              keyboardType:TextInputType.number ,
            ),
            ElevatedButton(onPressed: (){
              c.addproducts();
            }, child: Text("Update"))
          ],
        ) ),
    );
  }
}