import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: Column(
        children: [

//edit profile button
     Padding(
      padding:const EdgeInsets.all(8.0),
      child: const Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.edit, color: whiteColor,),
        ).onTap((){
          Get.to(()=>const EditProfileScreen());
        })
    ),


//user details section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              children: [Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Dummy user".text.fontFamily(semibold).white.make(),
                    "Customer@example.come".text.white.make(),
              ]),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: whiteColor,
                  )
                ),
                onPressed: ()async{
                  await Get.put(AuthController()).signOutMethod(context);
                  Get.offAll(()=>const LoginScreen());
                }, child:const Text("Logout").text.fontFamily(semibold).white.make()),
              ],
            ),
          ),
          20.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailsCard(count: "00", title: "In your cart", width: context.screenWidth / 3.6),
            detailsCard(count: "17", title: "In your Wishlist", width: context.screenWidth / 3.6),
          ],
        ),

        //buttons section
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              color: lightGrey,
            );
          },
          itemCount: profileButtonsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading:Image.asset(profileButtonsIcon[index],width: 22,),
              title: "${profileButtonsList[index]}".text.fontFamily(bold).make(),
            ) ;
          },
        ).box.white.rounded.margin(EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),


        ],
      ),
    ));
  }
}