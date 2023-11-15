import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryDetails extends StatelessWidget {
  final String? title;
   const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title:title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
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
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          temp,
                          height: 150,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        
                        "Broccoli".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                        10.heightBox,
                      ],
                    )
                    .box
                    .white
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .roundedSM
                    .padding(const EdgeInsets.all(12))
                    .make().onTap(() {
                      Get.to(()=>ItemDetails(title: "items"));
                    });
                  },
                ),
              ),
            ]
            ),
        ),
        ),
    );
  }
}