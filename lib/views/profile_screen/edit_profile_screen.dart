import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/images.dart';
import '../../widgets_common/custom_textfield.dart';


class EditProfileScreen extends StatelessWidget {

  final dynamic data;

  const EditProfileScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {

   var controller= Get.find<ProfileController>();
   //controller.nameController.text = data['name'];
   //controller.passController.text = data['password'];

    return bgWidget(
      Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=>
           Column(
              mainAxisSize: MainAxisSize.min,
              children: [
        
        
        //if data image url and controller path is empty
                data['imageUrl'] == '' &&  controller.profileImgPath.isEmpty ? 
                Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 

        //if data is not empty but controller path is empty
                :
                data['imageUrl'] !='' && controller.profileImgPath.isEmpty?
                
                Image.network(data['imageUrl'],width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                :
                 Image.file(File(controller.profileImgPath.value),
                width: 100,
                fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make() ,
        
        
        
                10.heightBox,
                ourButton(
                  color: redColor,
                  onPress: (){
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "change",
                ),
                const Divider(),
                20.heightBox,
                customTextField(controller:controller.nameController ,hint: nameHint, title: name, isPass: false),
                customTextField(controller: controller.passController,hint: passwordHint, title: password, isPass: false),
                20.heightBox,
                controller.isloading.value ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                )                
                :SizedBox(
                  width: context.screenWidth - 60,
                  child: ourButton(color: redColor, 
                  onPress: ()async{
                    controller.isloading(true);
                   await controller.uploadProfileImage();
                   await controller.updateProfile(
                    imgUrl: controller.profileImageLink,
                    name: controller.nameController.text,
                    password: controller.passController.text
                   );
                   VxToast.show(context, msg: "Updated");
                  }, 
                  textColor: whiteColor, 
                  title: "Sve changes")),
              ],
            ).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top:50, left: 12,right: 12)).rounded.make(),
        ),
          ),
      );
  }
}