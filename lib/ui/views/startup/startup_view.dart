import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/ui/common/constants.dart';
import 'package:thrivia_app/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                lightMode(context) ? AppImages.logoLight : AppImages.logoDark,
                width: 250,
                height: 70,
              ),
              const SizedBox(height: 16),
              Text(
                'Financial freedom through community',
                textAlign: TextAlign.center,
                style: GoogleFonts.onest(
                  // color: Theme.of(context).,
                  fontSize: 12,

                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Text(
        //       'STACKED',
        //       style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        //     ),
        //     Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Text('Loading ...', style: TextStyle(fontSize: 16)),
        //         horizontalSpaceSmall,
        //         SizedBox(
        //           width: 16,
        //           height: 16,
        //           child: CircularProgressIndicator(
        //             color: Colors.black,
        //             strokeWidth: 6,
        //           ),
        //         )
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
