
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/style_colors.dart';



class ResuableTextField extends StatelessWidget {

  final TextEditingController controllerValue;
  final IconData? icon;
  final String lableText;
  final String hintText;
  final VoidCallback? onTap;
  final String? errorMsg;
  final dynamic keyBordType;


  ResuableTextField({required this.controllerValue,  this.icon, required this.lableText, this.onTap, this.errorMsg, required this.hintText, this.keyBordType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerValue,
        keyboardType: keyBordType,
        validator: (value){
        if(value!.isEmpty || value == null){
          return errorMsg;
        }
        },
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: onTap,
              child: Icon(icon, color: Styles.primaryColor,size: 20,)),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,
          label: Text(lableText),
          labelStyle: TextStyle(color: Styles.primaryColor, fontWeight: FontWeight.w400, fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Styles.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
    );
  }
}
