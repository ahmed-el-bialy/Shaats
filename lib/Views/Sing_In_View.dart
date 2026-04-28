import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shaats/Widgets/Button_Widget.dart';
import 'package:shaats/Widgets/Custom_Form_Text_Field.dart';
import 'package:shaats/Widgets/Logo_Widget.dart';
import 'package:shaats/Widgets/Password_Text_Feild.dart';
import '../helper/Constants.dart';
import '../helper/show_Snack_Bar.dart';
import 'Chat_View.dart';
import 'Sing_Up_View.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  static String id = "SignIn";

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? emailValue;

  String? passwordValue;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

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
                  "Sign in...",
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
                hint: "Enter your password",
                preIcon: Icon(Icons.password, size: 30),
                onChanged: (data) {
                  passwordValue = data;
                },

              ),
              SizedBox(height: 15),
              ButtonWidget(
                name: "Log In",
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await logIn();
                      isLoading = false;
                      setState(() {});
                      Navigator.pushNamed(
                        context,
                        ChatView.id,
                        arguments: emailValue,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                          context,
                          'Wrong password provided for that user.',
                        );
                      }
                    }
                  } else {}
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    child: Text(
                      "Sing Up",
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

  Future<void> logIn() async {
    var auth = FirebaseAuth.instance;
    final credential = await auth.signInWithEmailAndPassword(
      email: emailValue!,
      password: passwordValue!,
    );
  }
}
