import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  Color? buttonColor;
  Color? textColor;
  String? textValue;
  Function onPressed;

  CustomPrimaryButton({this.buttonColor, this.textColor, this.textValue, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            textValue,
            style: heading5.copyWith(color: textColor)
          ),
        ),
      ),
    );
  }
}
