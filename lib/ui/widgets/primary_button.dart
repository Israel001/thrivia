// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;
  final Widget? child;
  final bool loading;
  final Color? color;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: loading ? null : onPressed,
        child: loading
            ? CircularProgressIndicator()
            : label == null
                ? child
                : text);
  }
}
