import 'package:flutter/material.dart';
import '../helper/Constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircleAvatar(
          radius: 102,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(kLogo),
          ),
        ),
      ),
    );
  }
}
