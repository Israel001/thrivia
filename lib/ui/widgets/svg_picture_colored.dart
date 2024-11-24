import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureColored extends StatelessWidget {
  const SvgPictureColored({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
  });

  final String assetName;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).iconTheme.color;
    return SvgPicture.asset(
      assetName,
      colorFilter: effectiveColor == null
          ? null
          : ColorFilter.mode(effectiveColor, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}
