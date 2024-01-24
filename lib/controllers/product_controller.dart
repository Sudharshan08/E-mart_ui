//import 'dart:js';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  var quantity = 0.obs;
  var totalPrice = 0.obs;
  //if you want tick mark on color selection watch vedio 13 25:00 time 

  var subcat = [];

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for(var e in s[0].subcategory){
      subcat.add(e);
    }
  }

  increaseQuantity(totalQuantity){
    if(quantity.value < totalQuantity){
       quantity.value++;
    }
   
  }

  decreaseQuantity(){
    if(quantity.value > 0){
      quantity.value--;
    }
  }

  calculateTotalPrice(price){
    totalPrice.value = price * quantity.value;
  }

  addToCart({
    title, img, sellername, //color,
     qty, tprice,context,
  })async{
    await firestore.collection(cartCollection).doc().set({
      'title':title,
      'img':img,
      'sellername':sellername,
      //'color':color,
      'qty':qty,
      'tprice':tprice,
      'added_by':currentUser!.uid
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
  }

  //this is for , when we go back after increasing values and quantity , it needs to be reset after user click on back button
  resetValues(){
    totalPrice.value = 0;
    quantity.value = 0;
  }
}