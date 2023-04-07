import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_project_example/models/ProductModel.dart';
import 'package:get_project_example/resources/UrlResources.dart';
import 'package:dio/dio.dart' as webservice;
import 'package:get_project_example/views/ProductView.dart';

import '../views/UpdateProduct.dart';
class ProductController extends GetxController{
 
 RxList alldata = [].obs;
 RxBool isloading = false.obs;
 TextEditingController pname = TextEditingController();
 TextEditingController qty = TextEditingController();
 TextEditingController price = TextEditingController();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getallproducts();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    
  }
  
  getallproducts() async
  {
      try {
        isloading(true);
        var dio = webservice.Dio();
        var response = await dio.get(UrlResources.VIEW_PRODUCT);
        if(response.statusCode==200)
        {
          alldata.clear();
          var json = jsonDecode(response.data);
          List<ProductModel> tempdata = json["data"].map<ProductModel>((obj)=>ProductModel.fromJson(obj)).toList();
          alldata.addAll(tempdata);
          isloading(false);
          update();
        }
        
      } catch (e) {
        print(e);
        throw Exception('Failed to load data');
      }
  }
  deleteproduct(ProductModel obj) async
  {
      try {
        isloading(true);
        var dio = webservice.Dio();
        
         webservice.FormData formData = webservice.FormData.fromMap({
          'pid': obj.pid.toString(),
        });
         

        var response = await dio.post(UrlResources.DELETE_PRODUCT,data:formData);
        if(response.statusCode==200)
        {
         
          var json = jsonDecode(response.data);
          if(json["status"]=="true")
          {
            print("YESSSS");
             isloading(false);
            await getallproducts();
          }
          else
          {
              isloading(false);
          }
        }
        
      } catch (e) {
        print(e);
        throw Exception('Failed to load data');
      }
  }

   addproducts() async
  {
      try {
        isloading(true);
        var dio = webservice.Dio();
         webservice.FormData formData = webservice.FormData.fromMap({
          'pname': pname.text.toString(),
          'qty': qty.text.toString(),
          'price': price.text.toString(),
        });
        var response = await dio.post(UrlResources.ADD_PRODUCT,data: formData);
        if(response.statusCode==200)
        {
          var json = jsonDecode(response.data);
          if(json["status"]=="true")
          {
            Get.snackbar("Data Added", "Data Added Successfully");
            await getallproducts();
            Get.to(ProductView());
          }
          else
          {
              isloading(false);
          }
        }
      } catch (e) {
        print(e);
        throw Exception('Failed to load data');
      }
    }

    
    
    editproduct(ProductModel obj) async
    {
      try {
        isloading(true);
        var dio = webservice.Dio();
        
         webservice.FormData formData = webservice.FormData.fromMap({
          'pid': obj.pid.toString(),
        });
         

        var response = await dio.post(UrlResources.EDIT_PRODUCT,data:formData);
        if(response.statusCode==200)
        {
         
          var json = jsonDecode(response.data);
          if(json["status"]=="true")
          {
            pname.text = json["data"]["pname"];
            qty.text = json["data"]["qty"];
            price.text = json["data"]["price"];
            Get.to(UpdateProduct(updatedid: obj.pid.toString()));
          }
          else
          {
              isloading(false);
          }
        }
        
      } catch (e) {
        print(e);
        throw Exception('Failed to load data');
      }
    }

    updateproduct(updatedid) async
    {
      try {
        isloading(true);
        var dio = webservice.Dio();
         webservice.FormData formData = webservice.FormData.fromMap({
          'pname': pname.text.toString(),
          'qty': qty.text.toString(),
          'price': price.text.toString(),
          "pid":updatedid.toString()
        });
        var response = await dio.post(UrlResources.UPDATE_PRODUCT,data: formData);
        if(response.statusCode==200)
        {
          var json = jsonDecode(response.data);
          if(json["status"]=="true")
          {
            isloading(false);
            Get.snackbar("Data Added", "Data Update Successfully");
            await getallproducts();
            Get.to(ProductView());
          }
          else
          {
              isloading(false);
          }
        }
      } catch (e) {
        print(e);
        throw Exception('Failed to load data');
      }
    }


}