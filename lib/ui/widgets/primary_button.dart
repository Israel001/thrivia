// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:thrivia_app/common/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;
  final Widget? child;
  final bool loading;
  final Color? color;
  final double width;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    this.label,
    this.child,
    this.loading = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = Text(
      label ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Onest',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromWidth(width)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: loading ? null : onPressed,
          child: loading
              ? CircularProgressIndicator()
              : label == null
                  ? child
                  : text),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;
  final Widget? child;
  final bool loading;
  final Color? color;
  final double width;

  const SecondaryButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    this.label,
    this.child,
    this.loading = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = Text(
      label ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: lightMode(context) ? Color(0xFF1C2027) : Colors.white,
        fontSize: 14,
        fontFamily: 'Onest',
        fontWeight: FontWeight.w400,
      ),
    );
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromWidth(width)),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(
                  color: lightMode(context) ? Color(0xFF1C2027) : Colors.white),
              backgroundColor: Colors.transparent),
          onPressed: loading ? null : onPressed,
          child: loading
              ? CircularProgressIndicator()
              : label == null
                  ? child
                  : text),
    );
  }
}
