import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shaats/Views/Chat_View.dart';
import 'package:shaats/Widgets/Button_Widget.dart';
import 'package:shaats/Widgets/Custom_Form_Text_Field.dart';
import 'package:shaats/Widgets/Logo_Widget.dart';

import '../Widgets/Password_Text_Feild.dart';
import '../helper/Constants.dart';
import '../helper/show_Snack_Bar.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  static String id = "SignUn";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? emailValue;

  bool isLoading = false;

  String? passwordValue;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: kPrimaryColor,
          title: Text(
            "Shaats",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 5),
              LogoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Chat Anywhere, Anytime",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: "DeliusSwashCaps",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10,
                ),
                child: Text(
                  "Sign Up...",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ),
              CustomFormTextField(
                label: "Email",
                hint: "Enter your Email",
                preIcon: Icon(Icons.email, size: 30),
                onChanged: (data) {
                  emailValue = data;
                },
              ),
              PasswordTextField(
                label: "Password",
                hint: "Create your password",
                preIcon: Icon(Icons.password, size: 30),
                onChanged: (data) {
                  passwordValue = data;
                },
              ),
              SizedBox(height: 15),
              ButtonWidget(
                name: "Register",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await Register();
                      Navigator.pushNamed(
                        context,
                        ChatView.id,
                        arguments: emailValue,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        isLoading = false;
                        showSnackBar(context, 'weak password');
                      } else if (e.code == 'email-already-in-use') {
                        isLoading = false;
                        showSnackBar(
                          context,
                          "email already exists ,try Sing in",
                        );
                      }
                    }
                    isLoading = false;
                    setState(() {});
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "have already an Account? ",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sing In",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Register() async {
    var auth = FirebaseAuth.instance;
    final credential = await auth.createUserWithEmailAndPassword(
      email: emailValue!,
      password: passwordValue!,
    );
  }
}
