
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/style_colors.dart';


class ResueableTextFieldPasswordWidget extends StatelessWidget {

  final TextEditingController controllerText;


  ResueableTextFieldPasswordWidget({  required this.controllerText});

  @override
  Widget build(BuildContext context) {


    return Container(
      child:  TextFormField(
        controller: controllerText,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (value){
          if(value!.isEmpty || value == null){
            return "Please enter your password";
          }
          else if(value.length <= 6)
          {
            return "Password must be of 6 characters";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline,color: Styles.primaryColor,),
          fillColor: Colors.grey.shade100,
          filled: true,
          label: Text('Enter your passwrd'),
          labelStyle: TextStyle(fontSize: 17,color: Styles.primaryColor,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: Styles.primaryColor,),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: Styles.primaryColor,),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
