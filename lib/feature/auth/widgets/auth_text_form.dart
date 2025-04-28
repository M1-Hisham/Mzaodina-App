import 'package:flutter/material.dart';
import 'package:mzaodina_app/core/resources/resources.dart';

class AuthTextForm extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final bool? isObscureText;
  final bool? isclickable;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? colorEnableBorder;
  final Color? disabledBorder;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final int? maxLines;
  final FormFieldSetter<String>? onSaved;
  final Key? valueKey;

  const AuthTextForm({
    super.key,
    required this.hintText,
    this.contentPadding,
    this.isObscureText,
    this.hintStyle,
    this.style,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.validator,
    this.cursorColor,
    this.cursorErrorColor,
    this.hoverColor,
    this.fillColor,
    this.focusNode,
    this.nextFocusNode,
    this.colorEnableBorder,
    this.maxLines,
    this.onSaved,
    this.valueKey,
    this.isclickable,
    this.disabledBorder,
    this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: valueKey,
      initialValue: initialValue,
      enabled: isclickable,
      onFieldSubmitted:
          (value) => FocusScope.of(context).requestFocus(nextFocusNode),
      focusNode: focusNode,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            hintStyle ??
            TextStyle(color: R.colors.hintTextColorLight, fontSize: 14),

        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20, vertical: 19),
        suffixIcon: suffixIcon,
        hoverColor: hoverColor,
        filled: true,
        fillColor: fillColor ?? R.colors.formColorLight,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        // border: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Color.fromARGB(255, 139, 139, 139)),
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(color: R.colors.backgroundColorLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: colorEnableBorder ?? R.colors.borderColorsLight,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: const BorderRadius.all(Radius.circular(10)),
        //   borderSide: BorderSide(
        //     color: disabledBorder ?? const Color.fromARGB(255, 139, 139, 139),
        //   ),
        // ),
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      style: style,
      obscureText: isObscureText ?? false,
      cursorColor: cursorColor ?? R.colors.primaryColorLight,
      cursorErrorColor: cursorErrorColor ?? Colors.red,
      validator: (value) {
        return validator?.call(value);
      },
    );
  }
}
