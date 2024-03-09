import 'dart:io';
import 'package:e_commerced_app/pages/fast_pages/mobile_fast_pages.dart';
import 'package:e_commerced_app/widget_folder/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publisherkey;
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyBe1cRWTBtl5apszWFcyxVXkCaQAj_9i1I",
              appId: "1:198125877457:android:95708fb52daaf68f11edf0",
              messagingSenderId: "198125877457",
              projectId: "food-ecommerce-app-ce76c"))
      : Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food E Commerce App',
        home: FastPages());
  }
}
//if app is start FastPages name