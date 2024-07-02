import 'package:flutter/material.dart';
import 'package:well_fit_coach/contestants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.validator,
    this.hintText,
    this.iconData,
    this.isPassword = false,
    this.onSuffixIconTap,
    this.suffixIconData,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.elevation,
    this.hintStyle,
    this.onChanged,
    this.borderColor = Colors.transparent,
    this.prefixIcon,
    this.activeBorderColor = Colors.transparent,
    this.borderRadius = 18,
    this.contentPadding,
    this.suffix,
    this.filledColor = Colors.white,
    this.errorText,
    this.labelText,
    this.labelStyle,
    this.enabled = true, this.textStyle,
  }) : super(key: key);
  final TextEditingController controller;
  final Function()? onSuffixIconTap;
  final Function(dynamic value)? validator, onChanged;
  final String? hintText, labelText;
  final IconData? iconData;
  final bool isPassword;
  final IconData? suffixIconData;
  final TextInputType textInputType;
  final bool obscureText, enabled;
  final double? elevation, borderRadius;
  final TextStyle? hintStyle, labelStyle, textStyle;
  final Color borderColor, activeBorderColor, filledColor;
  final Widget? prefixIcon, suffix;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      child: TextFormField(
        scrollPadding: EdgeInsets.zero,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        obscureText: obscureText,
        controller: controller,
        style: textStyle,
        cursorColor: kMainColor,
        keyboardType: textInputType,
        enabled: enabled,
        validator: (value) => validator!(value),
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          errorText: errorText,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          suffixIcon: isPassword
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: InkWell(
                    onTap: () => onSuffixIconTap!(),
                    child: Icon(
                      suffixIconData,
                      color: const Color(0xff828894),
                    ),
                  ),
                )
              : null,
          suffix: suffix,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(color: borderColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
            borderSide: BorderSide(
              color: activeBorderColor,
            ),
          ),
          filled: true,
          prefix: const SizedBox(
            width: 8,
          ),
          fillColor: filledColor,
          hoverColor: kMainColor,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff828894),
              ),
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff828894),
              ),
        ),
      ),
    );
  }
}
