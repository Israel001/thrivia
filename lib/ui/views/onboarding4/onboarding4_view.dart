// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:thrivia_app/ui/common/constants.dart';
import 'package:thrivia_app/ui/common/ui_helpers.dart';

import 'onboarding4_viewmodel.dart';

class Onboarding4View extends StackedView<Onboarding4ViewModel> {
  const Onboarding4View({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    Onboarding4ViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              left: 25.0, right: 25.0, top: 42, bottom: 42),
          child: Column(
            children: [
              // logo
              Image.asset(
                lightMode(context) ? AppImages.logoLight : AppImages.logoDark,
                height: 55,
              ),
              verticalSpace(60),
              Text(
                'Which of the following applies to you?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),

              verticalSpace(60),

              MemberTypeCard(
                title: "Cooperative member",
                subtitle:
                    "I am an existing member of a cooperative or I am interested in becoming a member of an existing cooperative",
              ),
              verticalSpace(36),

              MemberTypeCard(
                title: "Cooperative owner",
                subtitle:
                    "I own an existing cooperative society or I am interested owing a cooperative society",
              ),
              verticalSpace(36),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Onboarding4ViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      Onboarding4ViewModel();
}

class MemberTypeCard extends StatelessWidget {
  final String title, subtitle;
  const MemberTypeCard({
    super.key,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Container(
        height: 85,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, 0.1),
            end: Alignment(1.00, -0.10),
            // stops: [0, 0.1],
            colors: [
              Color(0xFFF4F4F4).withOpacity(0.20),
              Colors.white.withOpacity(0.0444)
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x7FE7E7E7)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            //text
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            )),
            // horiontalSpace(22),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
