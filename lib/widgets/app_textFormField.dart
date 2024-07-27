import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
typedef  OnChanged = void Function(String)?;
typedef Validator = String? Function(String?)?;
Widget appTextFormField ({required String hint , required IconData icon , required
OnChanged onChanged , required Validator validator , required Color color ,
  bool isValidate = true ,
  bool obscure = false , required TextEditingController controller , bool isNumberType = false ,
  Widget? suffixIcon}){

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      keyboardType: isNumberType ? TextInputType.number : null ,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hint ,
          hintStyle: TextStyle(
              color: color
          ),
          border: const UnderlineInputBorder() ,
          prefixIcon: Icon(icon , color: AppColors.primaryColor,) ,
          suffixIcon: suffixIcon,
           fillColor: Colors.grey.shade200,
        filled: true
      ),
    ),
  );
}