//import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'main.dart';
//
//
//
//
//class UserAuth {
//  String statusMsg="Account Created Successfully";
//  //To create new User
//  Future<String> createUser(UserData userData) async{
//    print(userData.emailId);
//    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    await firebaseAuth
//        .createUserWithEmailAndPassword(
//        email: userData.emailId, password: userData.password);
//    return statusMsg;
//  }
//
//  //To verify new User
//  Future<String> verifyUser (logindetails user) async{
//    print(user.emailId);
//    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    await firebaseAuth
//        .signInWithEmailAndPassword(email: user.emailId, password: user.password);
//    return "Login Successfull";
//  }
//}