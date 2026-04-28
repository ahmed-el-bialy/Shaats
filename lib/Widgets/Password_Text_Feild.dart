import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.preIcon,
    this.onChanged,
  });

  final String label;
  final String hint;
  final Icon preIcon;
  Function(String)? onChanged;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "this Field is required";
          } else {
            return null;
          }
        },
        style: TextStyle(color: Colors.white, fontSize: 18),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 25),
          prefixIcon: widget.preIcon,
          suffixIcon: IconButton(
            onPressed: () {
              obscure = !obscure;
              setState(() {
                obscure;
              });
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: obscure == true
                  ? Icon(CupertinoIcons.eye_slash_fill)
                  : Icon(Icons.remove_red_eye_rounded),
            ),
            color: Colors.white,
            iconSize: 30,
          ),
          prefixIconColor: Colors.white,
          label: Text(
            widget.label,
            style: TextStyle(fontSize: 25, color: Colors.grey),
          ),
          hint: Text(widget.hint),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.white, width: 1.2),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.2),
            borderRadius: BorderRadius.circular(18),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red, width: 1.2),
          ),
        ),
        obscureText: obscure,
      ),
    );
  }
}
