import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';



class LoginScreen extends StatelessWidget {
   const LoginScreen({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context,) {
    //use child before scaffold below and remove child comments from bg_widget
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            .10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(20).make(),
            10.heightBox,


            Column(
              children: [
                //change email to number from below and also chnage in const folder 
                customTextField(hint: email, title: email),
                customTextField(hint: passwordHint, title: password),
                Align(
                  alignment: Alignment.centerRight,
                  child:TextButton( onPressed:(){}, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                  //ourButton().box.width(context.screenWidth -50).make(),
                  //remove comments from here

                  //routing to home page
                  ourButton(color: redColor, title: login, textColor: whiteColor, onPress: (){
                    Get.to(()=>const Home());
                  }).box.width(context.screenWidth-50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  //routing to signup page
                  ourButton(color: golden, title: signup, textColor: redColor, onPress: (){
                    Get.to(()=>const SignupScreen());
                  }).box.width(context.screenWidth-50).make(),


                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
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