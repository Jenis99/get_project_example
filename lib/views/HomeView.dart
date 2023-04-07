import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_project_example/views/ContactView.dart';
import 'package:get_project_example/views/ProductView.dart';
import 'package:http/http.dart';

import '../controllers/HomeController.dart';

class HomeView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    HomeController c = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Number 1"),
            TextField(
              controller: c.num1,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0,),
             Text("Number 2"),
            TextField(
               controller: c.num2,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: ()
            {
              c.calculate();
              //controller.display();
              //Get.off(ContactView());
              // Get.to(ContactView());
              // Get.back();
              //Get.offAll(NextScreen());
            }, child: Text("Add")),
            Obx(() => Text(c.total.toString())),
            // ElevatedButton(onPressed: (){
            //   Get.to(ProductView());
            // }, child: Text("Product View"))
          
          
          // For Snackbar Showing
          ElevatedButton(onPressed: (){
            Get.snackbar('SnackBar', 'This is My Snackbar',icon: Icon(Icons.access_time));
          }, child: Text("Show Snackbar")),

          // DefaulDialog Box
          ElevatedButton(onPressed: (){
            Get.defaultDialog(
              title: 'Delete',
              middleText: 'Are You Sure For That !!!!',
              onConfirm: (){
                Get.back();
              },
              onCancel: (){
                Get.back();
              },
              textConfirm:'ok',
              textCancel: 'cancle' 
            );
          }, child: Text("Default Dialog")),
          ListTile(
            title: Text("Open Bottom Sheet"),
            onTap: (){
              Get.bottomSheet(
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Text("Light Mode"),
                          ],
                        ),
                        onTap: (){
                          Get.changeTheme(ThemeData.light());
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text("Dark Mode"),
                        onTap: (){
                          Get.changeTheme(ThemeData.dark());
                          Get.back();
                        },
                      )
                    ],
                  ),
                )
              );
            },
            ),
          
          ],
        ),
      ),
    );
  }

}