import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String?title;
  final dynamic data;
  const ItemDetails({super.key, required this.title,this.data});

  @override
  Widget build(BuildContext context) {
    //product controller to item detail to increase or decrease the item count quantity
    var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    itemCount: data['p_imgs'].length,
                    aspectRatio: 16/9,
                    viewportFraction: 1.0,
                     itemBuilder: (context,index){
                    return Image.network(data['p_imgs'][index], width: double.infinity,fit: BoxFit.cover);
                  }
                  ),
                  10.heightBox,

                  //title and details section
                  title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  //cost 
                  "${data['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(20).make(),
                  10.heightBox,

                   Row(
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "${data['p_seller']}".text.fontFamily(semibold).color(darkFontGrey).size(17).make(),
                        ],
                      )),
                        const CircleAvatar(
                        backgroundColor: whiteColor,
                        child:Icon(Icons.message_rounded,color: darkFontGrey,),
                      ),
                    ],
                  ).box.height(70).padding(const EdgeInsets.symmetric(horizontal: 16),).color(textfieldGrey).make(),


                  //quantity row
                  //when increase quantity total not updating , watch vedio 13 last part

                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: "Quantity:".text.color(textfieldGrey).make(),
                      ),
                     Obx(()=>
                         Row(
                          children: [
                            IconButton(onPressed: (){
                              controller.decreaseQuantity();
                              controller.calculateTotalPrice(int.parse(data['p_price']));
                            }, icon:const Icon(Icons.remove)),
                            controller.quantity.value.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                             IconButton(onPressed: (){
                              controller.increaseQuantity(int.parse(data['p_quantity']));
                              controller.calculateTotalPrice(int.parse(data['p_price']));
                             }, icon:const Icon(Icons.add)),
                             10.widthBox,
                             "(${data['p_quantity']} available)".text.color(textfieldGrey).make(),
                          ],
                        ),
                      ),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).make(),


// total row
             Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: "Total:".text.color(textfieldGrey).make(),
                      ),
                     "${controller.totalPrice.value}".numCurrency.text.color(redColor).size(17).fontFamily(bold).make(),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).make(),

              //description section
              10.heightBox,
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                "${data['p_desc']}".text.color(darkFontGrey).make(),
//to include seller policy , vedio , reviews, return policy etc.. vedio ui#6 time  16:30
                ],
              ),
            ),
          ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ourButton(color: redColor, 
            onPress: (){
              controller.addToCart(
                context: context,
                img: data['p_imgs'][0],
                qty: controller.quantity.value,
                sellername: data['p_seller'],
                title: data['p_name'],
                tprice: controller.totalPrice.value );
                VxToast.show(context, msg: "Added to cart");
            }, 
            textColor: whiteColor, title: "Add to cart"),
          )
        ],
      ),
    );
  }
}