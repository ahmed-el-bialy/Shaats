import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaats/Views/Chat_View.dart';
import 'package:shaats/Views/Sing_In_View.dart';
import 'package:shaats/Views/Sing_Up_View.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = FirebaseFirestore.instance;
  runApp(const Shaats());
}



class Shaats extends StatelessWidget {
  const Shaats({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignInView.id: (context)=>SignInView(),
        SignUpView.id: (context)=>SignUpView(),
        ChatView.id: (context)=>ChatView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "SignIn",
    );
  }
}
