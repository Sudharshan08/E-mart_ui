import 'package:emart_app/consts/consts.dart';
//import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:html';
//import 'package:js/js.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';
import '../home_screen/home.dart';


class  SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  // remove for signup method when creating phone number login
var controller = Get.put(AuthController());
//text controllers for taking input from signup page

var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var passwordRetypeController = TextEditingController();

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


            Obx(
              () => 
               Column(
                children: [
                  //change email to number from below and also chnage in const folder 
                  customTextField(hint: nameHint, title: name,controller: nameController,isPass: false),
                  customTextField(hint: email, title: email,controller: emailController, isPass: false),
                  customTextField(hint: passwordHint, title: password,controller: passwordController, isPass: true),
                  customTextField(hint: passwordHint, title: retypePassword,controller: passwordRetypeController, isPass: true),
                  //create new 
                     
            
            
            
                  Align(
                    alignment: Alignment.centerRight,
                    child:TextButton( onPressed:(){}, child: forgetPass.text.make()),
                  ),
            
            
                  //checkbox code     
                    
                    
                    Row(
                      children: [
              Checkbox(
                activeColor: redColor,
                checkColor: whiteColor,
                value: isCheck,
                onChanged: (newValue){
                  setState(() {
                    isCheck = newValue;
                  });
                },
                ),
                10.heightBox,
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                    children: [
                      TextSpan(
                        text:'i agree t the',
                      style: TextStyle(
                        fontFamily: regular, color: fontGrey
                        ),
                      ),
                      TextSpan(
                        text: termAndCond,
                      style: TextStyle(
                        fontFamily: regular, color: redColor
                        ),
                      ),
                      TextSpan(
                        text: "&",
                      style: TextStyle(
                        fontFamily: regular, color: fontGrey
                        ),
                      ),
                      TextSpan(
                        text: privacyPolicy,
                      style: TextStyle(
                        fontFamily: regular, color: redColor,
                        ),
                      ),
                    ]
                  )),
                  )
                      ],
                    ),
                    5.heightBox,
                    //ourButton().box.width(context.screenWidth -50).make(),
                    //remove comments from here
                    controller.isloading.value? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                   )
                   : ourButton(
                      color: isCheck == true? redColor:lightGrey, 
                      title: signup, 
                      textColor: whiteColor, 
                      onPress: ()async{
                        if(isCheck !=false){
                          controller.isloading(true);
                          try{
                            await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text).then((value){
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            }).then((value){
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(()=>const Home());
                            });
            
                          }catch(e){
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                            controller.isloading(false);
                          }
                        }
                    }).box.width(context.screenWidth-50).make(),
                    5.heightBox,
                    //createNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                   //ourButton(color: golden, title: signup, textColor: redColor, onPress: (){}).box.width(context.screenWidth-50).make(),
                   
                   
                   //Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      //children: [
                       // alreadyHaveAccount.text.color(fontGrey).make(),
                        //login.text.color(redColor).make().onTap(() {
                         // Get.back();
                        //}),
                      //],
                    //),
            
                    10.heightBox,
                    //loginWith.text.color(fontGrey).make(),
                    5.heightBox,
            
                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).make(),
            ),
          ],
        ),
      ),
    )
    );
  
  }
}