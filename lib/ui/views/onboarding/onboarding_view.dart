// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/main.dart';
import 'package:thrivia_app/ui/common/app_colors.dart';
import 'package:thrivia_app/ui/common/primary_button.dart';
import 'package:thrivia_app/ui/common/ui_helpers.dart';

import '../../../app/app.locator.dart';
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
      // backgroundColor: Theme.of(context).colorScheme.surface,
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
                colors: lightMode(context)
                    ? AppColors.lightLinear
                    : AppColors.blackLinear2,
              ),
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints.loose(Size(double.infinity, 812)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 46, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //top badge
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Image.asset(
                          theme.brightness == Brightness.light
                              ? AppImages.logoLight
                              : AppImages.logoDark,
                          // width: 111,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Body(
                                  pageChanged: (newIndex) {
                                    viewModel.changePage(newIndex);
                                  },
                                ),

                                //dots
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 74,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: DotsIndicator(
                                      dotsCount: onboardingText.length,
                                      position: viewModel.pageIndex,
                                      decorator: DotsDecorator(
                                        size: dotsSize,
                                        activeSize: dotsSize,
                                        // activeSize: const Size(18.0, 9.0),
                                        activeColor: AppColors.k_272816C,
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //get started

                            verticalSpaceMedium,
                            // already have an account
                            SwitchSignInType(
                              onLoginPage: false,
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

class SwitchSignInType extends StatelessWidget {
  final bool onLoginPage;
  const SwitchSignInType({
    Key? key,
    required this.onLoginPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          onLoginPage ? "Don’t have an account? " : 'Already have an account? ',
          style: theme.textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: () {
            final navigator = locator<NavigationService>();
            onLoginPage
                ? navigator.replaceWithCreateAccountView()
                : navigator.replaceWithLoginView();
          },
          child: Text(
            onLoginPage ? "Create one" : 'Log in',
            style: theme.textTheme.bodySmall!.copyWith(
              color: AppColors.k_272816C,
              fontWeight: FontWeight.w700,
              decorationColor: AppColors.k_272816C,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatefulWidget {
  final void Function(int) pageChanged;

  const Body({
    super.key,
    required this.pageChanged,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController();
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 216,
        child: PageView(
          controller: _pageController,
          clipBehavior: Clip.hardEdge,
          onPageChanged: widget.pageChanged,
          padEnds: true,
          children: onboardingText
              .map((pageText) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // title
                        Text(
                          pageText["title"]! as String,
                          style: TextStyle(
                            color: AppColors.white,
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
                              color: AppColors.white,
                              fontSize: 13,
                              fontFamily: 'Onest',
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true,
                          ),
                        ),
                        verticalSpace(30),

                        //button
                        PrimaryButton(
                          onPressed: () {
                            var lastPage = pageText["position"] as int >=
                                onboardingText.length - 1;
                            if (lastPage) {
                              _navigationService.navigateToOnboarding4View();
                            } else {
                              _pageController.nextPage(
                                  duration: Durations.medium1,
                                  curve: Curves.easeIn);
                            }
                          },
                          label: pageText["button_text"] as String,
                        ),
                      ],
                    ),
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
