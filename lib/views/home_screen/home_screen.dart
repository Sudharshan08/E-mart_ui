import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/home_buttons.dart';
//import 'package:flutter/material.dart';
//import 'package:emart_app/widgets_common/bg_widget.dart';

class  HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                alignment: Alignment.center,
          color: lightGrey,
          child: TextFormField(
            decoration:const InputDecoration(
              suffixIcon: Icon(Icons.search),
              filled: true,
              fillColor: whiteColor,
              hintText: searchanything,
              hintStyle: TextStyle(color: textfieldGrey),
            ),
          ),
        ),
    
    Expanded(child:
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child:   Column(
      
      children: [
      
          //swiper brands 1
      
      
      
          VxSwiper.builder(
      
            aspectRatio: 16/9,
      
            autoPlay: true,
      
            height: 150,
      
            enlargeCenterPage: true,
      
            itemCount: slidersList.length, 
      
            itemBuilder: (context, index){
      
              return Image.asset(
      
                slidersList[index], 
      
                fit: BoxFit.fitWidth,
      
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
      
            }
      
            ),
      
            5.heightBox,
      
            //deals buttons
      
            Row(
      
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
              children: List.generate(2, (index) => homeButtons(
      
                height: context.screenHeight * 0.1,
      
                width: context.screenWidth / 2.5,
      
                icon: index == 0 ? icTodaysDeal: icFlashDeal,
      
                title: index == 0 ? todaydeal: flashsale,
      
              )),
      
            ),
      
      // second slider or sweeper
      
             VxSwiper.builder(
      
            aspectRatio: 16/9,
      
            autoPlay: true,
      
            height: 150,
      
            enlargeCenterPage: true,
      
            itemCount: secondSliderList.length, 
      
            itemBuilder: (context, index){
      
              return Image.asset(
      
                slidersList[index], 
      
                fit: BoxFit.fitWidth,
      
                ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
      
            }
      
            ),
      
            
      
            Row(
      
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
              children: List.generate(
      
                3,
      
                 (index) => homeButtons(
      
                height: context.screenHeight * 0.15,
      
                width: context.screenWidth / 3.5,
      
                icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
      
                title: index == 0 ? topCategories : index == 1 ? icBrands : icTopSeller,
      
              )
      
              ),
      
            ),
      
            10.heightBox,
      
            //featured category
            //Align(
             // alignment: Alignment.centerLeft,
              //child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),
       //  ),
        // 20.heightBox,
    //if want to include featured categories then code below vedio timing ui#4 full
         //Row(
         // children:List.generate(3, (index) => Column(
          //  children: [],
          //)).toList(),
         //),
      
      ],
      
      ),
    ),
    ),
      
    
    
        ],
        ),
        ),
      ),
    );
  }
}