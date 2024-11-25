import 'package:flutter/material.dart';
import 'package:thrivia_app/common/app_colors.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Submit application',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF27816C),
                fontSize: 20,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            16.verticalSpace,
            Text(
              'Kindly ensure that all data was provided correctly before submitting your application.\n You can’t edit an application once it’s submitted',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF646464),
                fontSize: 14,
                fontFamily: 'Onest',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
            32.verticalSpace,
            PrimaryButton(
              onPressed: () {},
              label: "Submit application",
            ),
            16.verticalSpace,
            SecondaryButton(
              onPressed: () {},
              label: "Cancel",
            )
          ],
        ));
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //   decoration: const BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(10),
    //       topRight: Radius.circular(10),
    //     ),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         request.title!,
    //         style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
    //       ),
    //       verticalSpaceTiny,
    //       Text(
    //         request.description!,
    //         style: const TextStyle(
    //           fontSize: 14,
    //         ),
    //         maxLines: 3,
    //         softWrap: true,
    //       ),
    //       verticalSpaceLarge,
    //     ],
    //   ),
    // );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
