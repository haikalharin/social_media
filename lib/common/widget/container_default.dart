import 'package:flutter/material.dart';

class ContainerDefault extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Alignment? alignment;
  final Color? colorDecoration;
  final double? radius;
  final Widget? child;
  const ContainerDefault({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.colorDecoration,
    this.radius,
    this.child,
  }) : super(key: key);

  @override
  _ContainerDefaultState createState() => _ContainerDefaultState();
}

class _ContainerDefaultState extends State<ContainerDefault> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: widget.alignment ?? Alignment.centerLeft,
        width: widget.width,
        height: widget.height,
        margin: widget.margin ??
            EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        padding: widget.padding ??
            EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        decoration: BoxDecoration(
            color: widget.colorDecoration,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.radius ?? 0))),
        child: widget.child ?? Container());
  }
}
