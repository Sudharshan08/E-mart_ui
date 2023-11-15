import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';


class  SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            .10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(20).make(),
            10.heightBox,


            Column(
              children: [
                //change email to number from below and also chnage in const folder 
                customTextField(hint: nameHint, title: name),
                customTextField(hint: email, title: email),
                customTextField(hint: passwordHint, title: password),
                customTextField(hint: passwordHint, title: retypePassword),
                Align(
                  alignment: Alignment.centerRight,
                  child:TextButton( onPressed:(){}, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                  //ourButton().box.width(context.screenWidth -50).make(),
                  //remove comments from here
                  ourButton(color: redColor, title: signup, textColor: whiteColor, onPress: (){}).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  //createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                 //ourButton(color: golden, title: signup, textColor: redColor, onPress: (){}).box.width(context.screenWidth-50).make(),


                  10.heightBox,
                  //loginWith.text.color(fontGrey).make(),
                  5.heightBox,

              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).make(),
          ],
        ),
      ),
    )
    );
  
  }
}