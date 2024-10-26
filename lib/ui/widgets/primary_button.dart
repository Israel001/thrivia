// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool loading;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? CircularProgressIndicator()
            : Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ));
  }
}
