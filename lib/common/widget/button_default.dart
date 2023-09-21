
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonDefault extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final Color ?backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? font;
  final double? fontSize;
  final Function()? onPressed;
  final TextAlign? textAlign;
  final double? borderRadius;
  final bool? isBottomButton;

  const ButtonDefault(
      {Key? key,
      this.textAlign,
      this.width,
      this.height,
      this.title,
      this.backgroundColor,
      this.textColor,
      this.onPressed,
      this.fontWeight,
      this.font,
      this.fontSize,
      this.borderRadius,
      this.isBottomButton})
      : super(key: key);

  @override
  _ButtonDefaultState createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: widget.backgroundColor ?? HexColor(ColorSetup().colorPrimary),
        child: widget.isBottomButton == false
            ? _getButtonWidget()
            : SafeArea(child: _getButtonWidget()));
  }

  _getButtonWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary:
              widget.backgroundColor ?? Colors.deepPurple,
          minimumSize: Size(widget.width ?? 100.w, widget.height ?? 50),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(widget.borderRadius ?? 5),
          )),
      onPressed: widget.onPressed,
      onLongPress: widget.onPressed,
      child: Text(widget.title ?? "",
          textAlign: widget.textAlign ?? TextAlign.center,
          style: TextStyle(
              fontSize: widget.fontSize ?? 14,
              color: widget.textColor ?? Colors.white,
              fontWeight: widget.fontWeight ?? FontWeight.w400)),
    );
  }
}
