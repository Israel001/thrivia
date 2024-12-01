import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_viewmodel.dart';

import '../register_cooperative/register_cooperative_view.form.dart';
import '../register_cooperative/register_cooperative_viewmodel.dart';
import '../../../../ui/widgets/dropdown_form_field.dart';

import 'package:thrivia_app/ui/widgets/input_field.dart';

class Page2 extends StatelessWidget with $RegisterCooperativeView {
  final RegisterCooperativeViewModel viewModel;
  const Page2({
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
              percent: 0.66,
              center: Text(
                "2/3",
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

        CustomInputField(
          iconPath: AppImagesSVG.cardAdd,
          errorText: viewModel.cooperativeIdValidationMessage,
          child: DropdownFormField(
              hintText: "Preferred payment method",
              controller: transactionMethodController,
              values: PaymentMethod.values),
        ),

        CustomInputField(
          iconPath: AppImagesSVG.bank,
          child: DropdownFormField(
            hintText: "Select bank",
            controller: bankController,
            values: ["First bank", "Union bank"],
          ),
          errorText: viewModel.bankValidationMessage,
        ),

        CustomInputField(
          iconPath: AppImagesSVG.$123,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Account number"),
            controller: acountNumberController,
            keyboardType: TextInputType.number,
          ),
          errorText: viewModel.acountNumberValidationMessage,
        ),

        CustomInputField(
          iconPath: AppImagesSVG.account_cog,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Account name"),
            controller: accountNameController,
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.accountNameValidationMessage,
        ),
      ],
    );
  }
}
