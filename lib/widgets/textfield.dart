import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  TextEditingController textEditingController;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  bool isObscure, isPassword;
  VoidCallback? onPress;

  MyTextfield(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.prefixIcon,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.onPress,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: textEditingController,
      validator: validator,
      onSaved: onSaved,
      style: MyFontStyle.subtitleText,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: MyColors.primaryColor,
          size: 24,
        ),
        suffixIcon: isPassword
            ? InkWell(
                onTap: onPress,
                child: isObscure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
        hintText: hintText,
        hintStyle: MyFontStyle.subtitleText,
        errorStyle: MyFontStyle.errorText,
      ),
    );
  }
}
