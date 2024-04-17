// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'dashboard-screen.dart'; // Import your dashboard screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation for 3 seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to DashboardScreen
      Get.offAll(() => DashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 29, 104, 165),
              Color.fromARGB(255, 88, 75, 75),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Lottie.asset(
                    'image/ann2.json'), // Add your Lottie animation path
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                "Powered By Fluxstore",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
