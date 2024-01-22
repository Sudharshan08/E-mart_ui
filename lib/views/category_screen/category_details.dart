import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets_common/loading_indicator.dart';
class CategoryDetails extends StatelessWidget {
  final String? title;
   const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title:title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
          
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Center(
                child: loadingIndicator(),
              );
            
                
              }else if(snapshot.data!.docs.isEmpty){
                return Center(
                  child: "No data found!".text.color(darkFontGrey).make(),
                );
              }else{

                var data = snapshot.data!.docs;

                return  Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) => "pure vegies".text.fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make(),),
                ),
              ),
20.heightBox,

              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          data[index]['p_imgs'][0],
                          height: 150,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        5.heightBox,
                        "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "${data[index]['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(16).make(),
                        10.heightBox,
                      ],
                    )
                    .box
                    .white
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .roundedSM
                    .padding(const EdgeInsets.all(12))
                    .make().onTap(() {
                      Get.to(()=>ItemDetails(title: "${data[index]['p_name']}",data: data[index],));
                    });
                  },
                ),
              ),
            ]
            ),
        );
              }
            }
        ),
        ),
    );
  }
}