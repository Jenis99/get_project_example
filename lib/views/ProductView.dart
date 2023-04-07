import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_project_example/controllers/ProductController.dart';
import 'package:get_project_example/models/ProductModel.dart';
import 'package:get_project_example/views/AddProduct.dart';
import 'package:http/http.dart';

class ProductView extends StatelessWidget {

 final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product View"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(AddProduct());
        },
        child: Icon(Icons.add),),
      body:Obx(() => (controller.isloading.value)?Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(
            itemCount: controller.alldata.length,
            itemBuilder: (context, index) {
              ProductModel obj = controller.alldata[index];
              return ListTile(
                title: Text(obj.pname.toString()),
                subtitle: Text(obj.price.toString()),
                onTap: () async{
                  await controller.editproduct(obj);
                  //await controller.deleteproduct(obj);
                },
              );
            },
          )
          ),
    );
  }
}