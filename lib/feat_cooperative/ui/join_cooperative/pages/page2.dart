import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.form.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_viewmodel.dart';
import 'package:thrivia_app/ui/widgets/dropdown_form_field.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';

class Page2 extends StatelessWidget with $JoinCooperativeView {
  final JoinCooperativeViewModel viewModel;
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
            "Become a member of Freedom Cooperative",
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
              controller: paymentMethodController,
              values: PaymentMethod.values),
          // child: Material.FormField<PaymentMethod>(
          //   onSaved: (newValue) {
          //     if (newValue != null) {
          //       paymentMethodController.text = newValue.name;
          //     }
          //   },
          //   builder: (field) => DropdownMenu<PaymentMethod>(
          //       expandedInsets: EdgeInsets.zero,
          //       dropdownMenuEntries: PaymentMethod.values
          //           .map((element) =>
          //               DropdownMenuEntry(value: element, label: element.label))
          //           .toList()),
          // ),
        ),

        CustomInputField(
          iconPath: AppImagesSVG.bank,
          child: DropdownFormField(
            hintText: "Select bank",
            controller: bankController,
            values: ["First bank", "Union bank"],
          ),
          errorText: viewModel.membershipNumberValidationMessage,
        ),

        CustomInputField(
          iconPath: AppImagesSVG.$123,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Account number"),
            controller: accountNumberController,
            keyboardType: TextInputType.number,
          ),
          errorText: viewModel.accountNumberValidationMessage,
        ),

        CustomInputField(
          iconPath: AppImagesSVG.account_cog,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Account name"),
            controller: accountNameController,
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.accountNumberValidationMessage,
        ),
      ],
    );
  }
}
