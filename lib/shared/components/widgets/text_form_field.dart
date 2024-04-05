
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String> validate,
  required String text,
  required IconData prefixIcon,
  required TextInputType keyboardType,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  Color textColor = Colors.black,
  Function? submit,
}) =>
    TextFormField(
      onFieldSubmitted: (value) {
        submit!(value);
      },
      validator: validate,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(

        labelText: text,
        labelStyle: TextStyle(
          color: textColor,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: mainColor,
        ),

        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(
            suffix,
            color: mainColor,
          ),
          onPressed: () {
            suffixPressed!();
          },
        )
            : null,
        // lw passet 7aga lel suffix el suffixicon hayb2a beysawi el suffix el baseto else yeb2a mafeee4(null)

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 30,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        filled: false,
      ),
      obscureText: isPassword,
    );