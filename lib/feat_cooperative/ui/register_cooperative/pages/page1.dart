import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';

import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/register_cooperative/register_cooperative_view.form.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/register_cooperative/register_cooperative_viewmodel.dart';

import 'package:thrivia_app/ui/widgets/input_field.dart';

class Page1 extends StatelessWidget with $RegisterCooperativeView {
  final RegisterCooperativeViewModel viewModel;
  const Page1({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              appLogoPath(context),
              height: 37,
            ),
            CircularPercentIndicator(
              radius: 37 / 2,
              lineWidth: 5.0,
              startAngle: 0,
              percent: 0.33,
              center: Text(
                "1/3",
              ),
              progressColor: Colors.green,
            )
          ],
        ),
        30.verticalSpace,

        Center(
          child: const Text(
            "To proceed, register your cooperative business",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),

        // 20.verticalSpace,

        //cooperative name
        CustomInputField(
          iconPath: AppImagesSVG.user,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Cooperative name"),
            controller: cooperativeNameController,
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.cooperativeNameValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.user,
          child: TextFormField(
            decoration: InputDecoration().copyWith(
              hintText: "Business registration number",
            ),
            controller: businessRegNumberController,
            keyboardType: TextInputType.phone,
          ),
          errorText: viewModel.businessAddressValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.location,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Business address"),
            controller: businessAddressController,
            keyboardType: TextInputType.streetAddress,
          ),
          errorText: viewModel.businessAddressValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.smsEdit,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Contact email address"),
            controller: emailAdressController,
            keyboardType: TextInputType.emailAddress,
          ),
          errorText: viewModel.emailAdressValidationMessage,
        ),

        CustomInputField(
          iconPath: AppImagesSVG.call,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Contact phone number"),
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
          ),
          errorText: viewModel.phoneNumberValidationMessage,
        ),
        20.verticalSpace,
      ],
    );
  }
}
