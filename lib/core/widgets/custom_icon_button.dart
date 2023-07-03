import 'package:flutter/material.dart';
import '../utils/size.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.width = .2,
    this.height = .05,
    this.backgroundColor = Colors.grey,
    this.text,
    this.padding = 10,
    required this.onPress,
    required this.icon,
  });
  final double width;
  final double height;
  final double padding;

  final Function() onPress;
  final Icon icon;
  final String? text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: CustomSize().widthSize(context, width),
        height: CustomSize().heightSize(context, height),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: backgroundColor),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: icon,
          ),
        ),
      ),
    );
  }
}
