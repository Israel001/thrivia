import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.form.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_viewmodel.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';

class Page1 extends StatelessWidget with $JoinCooperativeView {
  final JoinCooperativeViewModel viewModel;
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
            "Become a member of Freedom Cooperative",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),

        // 20.verticalSpace,

        //full name
        CustomInputField(
          iconPath: AppImagesSVG.user,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Full name"),
            controller: fullNameController,
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.fullNameValidationMessage,
        ),

        //date of birth
        CustomInputField(
          iconPath: AppImagesSVG.calendar,
          child: TextFormField(
            decoration: InputDecoration().copyWith(
              hintText: "Date of birth",
              suffixIcon: Icon(
                Icons.arrow_drop_down,
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 16.0,
                minHeight: 16.0,
              ),
            ),
            controller: dateOfBirthController,
            readOnly: true,
            onTap: () => viewModel.selectDateOfBirth(context),
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.dateOfBirthValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.call,
          child: TextFormField(
            decoration: InputDecoration().copyWith(
              hintText: "Phone number",
            ),
            // controller: ,
            keyboardType: TextInputType.phone,
          ),
          errorText: viewModel.phoneNumberValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.smsEdit,
          child: TextFormField(
            decoration: InputDecoration().copyWith(hintText: "Email address"),
            controller: emailAddressController,
            keyboardType: TextInputType.name,
          ),
          errorText: viewModel.emailAddressValidationMessage,
        ),

        // 20.verticalSpace,
        CustomInputField(
          iconPath: AppImagesSVG.location,
          child: TextFormField(
            decoration:
                InputDecoration().copyWith(hintText: "Residential address"),
            controller: residentialAddresController,
            keyboardType: TextInputType.streetAddress,
          ),
          errorText: viewModel.residentialAddresValidationMessage,
        ),

        20.verticalSpace,
      ],
    );
  }
}
