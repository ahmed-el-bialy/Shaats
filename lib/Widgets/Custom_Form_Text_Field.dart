import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.preIcon,
     this.onChanged,
    this.obscure=false,
  });

  final String label;
  final String hint;
  final Icon preIcon;
  Function(String)? onChanged;
  bool? obscure ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: TextFormField(
        obscureText: false,
        validator: (value){
          if(value!.isEmpty ){
            return "this Field is required";
          }
          else{
            return null;
          }
        },
          style:TextStyle(color: Colors.white,fontSize:18 ) ,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 25),
          prefixIcon: preIcon,
          prefixIconColor: Colors.white,
          label: Text(
            label,
            style: TextStyle(fontSize: 25, color: Colors.grey),
          ),
          hint: Text(hint),
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
      ),
    );
  }
}
