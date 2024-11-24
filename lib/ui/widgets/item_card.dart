// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:thrivia_app/common/ui_helpers.dart';

class ItemCard extends StatelessWidget {
  final Widget child;
  const ItemCard({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.10),
          end: Alignment(-1, 0.1),
          colors: lightMode(context)
              ? [
                  Color(0xFFF4F4F4),
                  Colors.white.withOpacity(0.5199999988079071)
                ]
              : [
                  Color(0xFFF4F4F4).withOpacity(0.20),
                  Colors.white.withOpacity(0.0444)
                ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0x7FE7E7E7)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
