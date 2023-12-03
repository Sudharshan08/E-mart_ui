import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
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

    var controller = Get.put(AuthController());

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


            Obx(()=> Column(
                children: [
                  //change email to number from below and also chnage in const folder 
                  customTextField(hint: emailHint, title: email, isPass:false,controller: controller.emailController ),
                  customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child:TextButton( onPressed:(){}, child: forgetPass.text.make()),
                    ),
                    5.heightBox,
                    //ourButton().box.width(context.screenWidth -50).make(),
                    //remove comments from here
            
                    //routing to home page
                   controller.isloading.value 
                   ?const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                   )
                   : ourButton(color: redColor, title: login, textColor: whiteColor, onPress: ()async{
                    controller.isloading(true);
                      await controller.loginMethod(context: context).then((value){
                        if(value!=null){
                          VxToast.show(context, msg: loggedin);
                          Get.to(()=>const Home());
                        }else{
                          controller.isloading(false);
                        }
                      });
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
            ),
          ],
        ),
      ),
    )
    );
      
   
    
  }
}