import 'package:flutter/material.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.form.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_viewmodel.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';

class Page0 extends StatelessWidget with $JoinCooperativeView {
  final JoinCooperativeViewModel viewModel;
  const Page0({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(42),
        // logo
        Center(
          child: Image.asset(
            appLogoPath(context),
            height: 55,
          ),
        ),
        30.verticalSpace,

        Center(
          child: const Text(
            "Start your thriving journey with us",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),

        20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.faceid,
          child: TextFormField(
            controller: cooperativeIdController,
            decoration:
                InputDecoration().copyWith(hintText: "Cooperative Unique ID"),
            keyboardType: TextInputType.number,
          ),
          errorText: viewModel.cooperativeIdValidationMessage,
        ),
        8.verticalSpace,
        Text(
          'Input ID of the cooperative society you want to join',
          style: TextStyle(
            color: Color(0xFF939090),
            fontSize: 10,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w300,
          ),
        ),
        24.verticalSpace,

        CustomInputField(
          iconPath: AppImagesSVG.userTag,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Membership number"),
            controller: membershipNumberController,
            keyboardType: TextInputType.number,
          ),
          errorText: viewModel.membershipNumberValidationMessage,
        ),
        8.verticalSpace,
        Text(
          'Input your member number if you have any',
          style: TextStyle(
            color: Color(0xFF939090),
            fontSize: 10,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
