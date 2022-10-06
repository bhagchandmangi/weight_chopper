import 'package:flutter/material.dart';

import 'package:weightchopper_flutter_project/utils/ColorConfig.dart';

import 'DDText.dart';

class MyTextField extends StatefulWidget {
  final String? title;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final VoidCallback? validator;
  final Function(String)? onFieldSubmit;
  final Function(String)? onChanged;
  final String? hintText;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onTapPrefixIcon;
  final suffixIconData;
  final bool? multiIcon;
  final IconData? prefixIconData;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? prefixIconColor;
  final Color? sufixIconColor;
  final Color? borderColor;
  final Widget? prefixWidget;
  final TextInputType? inputType;
  final bool? obscureText;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcons;
  final bool? fullBorder;
  final bool? validate;
  final bool? showLabel;

  static const Color _textFieldThemeColor = Color(0xff707070);

  const MyTextField({
    this.onChanged,
    this.width,
    this.validate,
    this.showLabel,
    this.height,
    this.fullBorder,
    this.borderColor,
    this.inputDecoration,
    this.multiIcon,
    this.title,
    this.onTap,
    this.controller,
    this.validator,
    this.onFieldSubmit,
    this.hintText,
    this.onTapSuffixIcon,
    this.suffixIconData,
    this.prefixIconData,
    this.onTapPrefixIcon,
    this.focusNode,
    this.backgroundColor = Colors.transparent,
    this.hintTextColor = _textFieldThemeColor,
    this.cursorColor = _textFieldThemeColor,
    this.textColor = _textFieldThemeColor,
    this.prefixIconColor = _textFieldThemeColor,
    this.sufixIconColor = _textFieldThemeColor,
    this.prefixWidget,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcons,
  });

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        obscureText: widget.obscureText! ?? false,
        obscuringCharacter: "*",
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        textCapitalization: TextCapitalization.sentences,
        focusNode: widget.focusNode,
        validator: (val) {
          if (widget.validate == true) {
            return "${widget.title} can not be empty";
          }
          widget.validator!();
          return "";
        },
        cursorWidth: 1,
        cursorColor: widget.cursorColor,
        autofocus: false,
        controller: widget.controller,
        style: textStyle.copyWith(
            decoration: TextDecoration.none, color: widget.textColor),
        onFieldSubmitted: widget.onFieldSubmit,
        decoration: widget.inputDecoration ??
            InputDecoration(
              hoverColor: Colors.white,
              labelText: widget.showLabel == true ? widget.title : null,
              labelStyle: textStyle.copyWith(color: widget.hintTextColor),
              hintText: widget.hintText,
              hintStyle: textStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  color: widget.hintTextColor,
                  fontSize: 14),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.fullBorder == false ? 0 : 20,
                  vertical: widget.fullBorder == false ? 15 : 2),
              suffixIcon: widget.suffixIconData == null
                  ? null
                  : widget.multiIcon == null
                      ? GestureDetector(
                          onTap: widget.onTapSuffixIcon,
                          child: Icon(
                            widget.suffixIconData,
                            color: widget.sufixIconColor,
                          ),
                        )
                      : widget.suffixIconData,
              prefixIcon: widget.prefixWidget ??
                  (widget.prefixIconData == null
                      ? null
                      : GestureDetector(
                          onTap: widget.onTapPrefixIcon,
                          child: Icon(
                            widget.prefixIconData,
                            color: widget.prefixIconColor,
                          ),
                        )),
              focusedBorder:
                  (widget.fullBorder == true || widget.fullBorder == null)
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: widget.borderColor! ?? widget.textColor!,
                              width: 1.5),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: widget.borderColor! ?? widget.textColor!,
                              width: 1.5),
                        ),
              suffix: widget.suffixIcons,
              enabledBorder: (widget.fullBorder == true ||
                      widget.fullBorder == null)
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1.5),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1.5),
                    ),
              disabledBorder: (widget.fullBorder == true ||
                      widget.fullBorder == null)
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1),
                    ),
              border: (widget.fullBorder == true || widget.fullBorder == null)
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              widget.borderColor ?? ColorConfig().primaryColor,
                          width: 1),
                    ),
            ),
      ),
    );
  }
}
