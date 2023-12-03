//backend functions

//import 'dart:html';
//import 'dart:js';

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:emart_app/consts/strings.dart';

class AuthController extends GetxController{
  //login method
  //below is to write down the code for phone number login method
  //refrence backend vedio 2
  var isloading = false.obs;

  //textcontrollers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    try{
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//signup method
//method for signup

  Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //code for storing data in database

  storeUserData({name, password, email}) async{
    DocumentReference store = await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password':password,
      'email':email,
      'id':currentUser!.uid,
    });
  }

  //code for signout method

  signOutMethod(context) async{
    try{
      await auth.signOut();
    }catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

}