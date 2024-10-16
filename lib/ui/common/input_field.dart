// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputField extends StatelessWidget {
  final String iconPath;

  final FormField child;

  final String? errorText;
  const CustomInputField({
    Key? key,
    required this.iconPath,
    required this.child,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final borderSide = BorderSide(width: 0.50, color: color);
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // height: 44,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                Container(
                  width: 40,
                  alignment: Alignment.center,
                  height: 48,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 12, vertical: 14),

                  decoration: BoxDecoration(
                    border: Border(
                      // left: BorderSide(color: Colors.white),
                      // top: BorderSide(color: Colors.white),
                      right: borderSide,
                      bottom: borderSide,
                    ),
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),

                // Container(
                //   width: 0.5,
                //   // height: double.infinity,
                //   color: borderSide.color,
                // ),
                // input field
                Expanded(
                  child: Container(
                    // height: 44,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      // top: 13,
                      left: 17,
                      right: 17,
                      // bottom: 13,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        // left: BorderSide(color: Colors.white),
                        // top: BorderSide(color: Colors.white),
                        // right: BorderSide(color: Colors.white),
                        bottom: borderSide,
                      ),
                    ),
                    child: SizedBox(child: child),
                  ),
                ),
              ],
            ),
          ),
          if (errorText != null)
            Padding(
              padding: EdgeInsets.only(top: 8, left: 45),
              child: Text(
                errorText!,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.colorScheme.error),
              ),
            ),
        ],
      ),
    );
  }
}
