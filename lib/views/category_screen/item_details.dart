import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String?title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
                    itemCount: 3,
                    aspectRatio: 16/9,
                     itemBuilder: (context,index){
                    return Image.asset(temp, width: double.infinity,fit: BoxFit.cover);
                  }
                  ),
                  10.heightBox,

                  //title and details section
                  title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  //cost 
                  "\$30,00".text.color(redColor).fontFamily(bold).size(20).make(),
                  10.heightBox,

                   Row(
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "In house vendors".text.fontFamily(semibold).color(darkFontGrey).size(17).make(),
                        ],
                      )),
                        const CircleAvatar(
                        backgroundColor: whiteColor,
                        child:Icon(Icons.message_rounded,color: darkFontGrey,),
                      ),
                    ],
                  ).box.height(70).padding(const EdgeInsets.symmetric(horizontal: 16),).color(textfieldGrey).make(),


                  //quantity row

                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: "Color:".text.color(textfieldGrey).make(),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon:const Icon(Icons.remove)),
                          "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                           IconButton(onPressed: (){}, icon:const Icon(Icons.add)),
                           10.widthBox,
                           "(0 available)".text.color(textfieldGrey).make(),
                        ],
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
                     "\$0.00".text.color(redColor).size(17).fontFamily(bold).make(),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).make(),

              //description section
              10.heightBox,
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                10.heightBox,
                "This is dummy description section ..... currently being used".text.color(darkFontGrey).make(),
//to include seller policy , vedio , reviews, return policy etc.. vedio ui#6 time  16:30
                ],
              ),
            ),
          ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ourButton(color: redColor, onPress: (){}, textColor: whiteColor, title: "Add to cart"),
          )
        ],
      ),
    );
  }
}