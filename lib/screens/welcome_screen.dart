import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:study_buddy/provider/auth_provider.dart';
import 'package:study_buddy/screens/registration_screen.dart';
import 'package:study_buddy/widgets/custum_button.dart';
import 'dart:developer' as devTools;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState(){
    super.initState();
    final ap = Provider.of<MyAuthProvider>(context, listen: false);
    
  }

  @override
  Widget build(BuildContext context) {
    String? uid = Provider.of<MyAuthProvider>(context, listen: true).getUserId;
    devTools.log(uid ?? "No user logged in");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 45,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  "assets/image1.png",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let's Get Started",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "It's never too late to start",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black26),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CustomButton(
                      text: "Get Started",
                      onPressed: () {
                        Get.to(()=>const RegistrationScreen());
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
