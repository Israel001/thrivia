import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/ui/common/app_colors.dart';
import 'package:thrivia_app/ui/common/ui_helpers.dart';

import '../../common/constants.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);

    final dotsWidth = screenWidth(context) / onboardingText.length -
        (onboardingText.length * 12);
    final dotsSize = Size(dotsWidth, 6);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onboardingBG),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.00, -1.00),
                end: Alignment(0, 1),
                colors: AppColors.blackLinear2,
              ),
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(Size(double.infinity, 812)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 46, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //top badge
                      Image.asset(
                        theme.brightness == Brightness.light
                            ? AppImages.logoLight
                            : AppImages.logoDark,
                        // width: 111,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Body(
                              pageChanged: (newIndex) {
                                viewModel.changePage(newIndex);
                              },
                            ),

                            //dots
                            DotsIndicator(
                              dotsCount: onboardingText.length,
                              position: viewModel.pageIndex,
                              decorator: DotsDecorator(
                                size: dotsSize,
                                activeSize: dotsSize,
                                // activeSize: const Size(18.0, 9.0),
                                activeColor: AppColors.k_272816C,
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                            ),

                            //get started

                            verticalSpaceMedium,
                            // already have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Onest',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: AppColors.k_272816C,
                                    fontSize: 12,
                                    fontFamily: 'Onest',
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}

class Body extends StatelessWidget {
  final void Function(int) pageChanged;
  const Body({
    super.key,
    required this.pageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 260,
        child: PageView(
          onPageChanged: pageChanged,
          padEnds: true,
          children: onboardingText
              .map((pageText) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      Text(
                        pageText["title"]! as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(16),
                      //subtitle
                      SizedBox(
                        height: 75,
                        child: Text(
                          pageText["subtitle"]! as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w400,
                          ),
                          softWrap: true,
                        ),
                      ),
                      verticalSpace(16),

                      //button
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            pageText["button_text"] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Onest',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ))
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

const onboardingText = [
  {
    "title": "Welcome to Thrivia",
    "subtitle":
        "Empowering your financial journey through community support and shared growth. Join us and unlock exclusive benefits tailored just for you",
    "position": 0,
    "button_text": "Next",
  },
  {
    "title": "Empower your future",
    "subtitle":
        "Easily manage your cooperative contributions, apply for loans, and participate in cooperative activities that drive growth for everyone.",
    "position": 1,
    "button_text": "Next",
  },
  {
    "title": "Grow your cooperative",
    "subtitle":
        "Oversee member contributions, manage loans, and manage transparent communication. Thrivia makes it easy to build a stronger cooperative",
    "position": 2,
    "button_text": "Get Started",
  },
];
