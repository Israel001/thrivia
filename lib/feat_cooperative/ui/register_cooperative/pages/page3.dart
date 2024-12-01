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

class Page3 extends StatelessWidget with $RegisterCooperativeView {
  final RegisterCooperativeViewModel viewModel;
  const Page3({
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
              percent: 1,
              center: Text(
                "3/3",
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
        24.verticalSpace,

        Text(
          'Identification Document Upload',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Onest',
            fontWeight: FontWeight.w400,
          ),
        ),

        CustomInputField(
          padding: EdgeInsets.only(top: 0),
          iconPath: AppImagesSVG.id,
          errorText: viewModel.cooperativeIdValidationMessage,
          child: DropdownFormField(
              hintText: "ID type",
              controller: idTypeController,
              values: ["International Passport", "NIN", "Driver's License"]),
        ),

        CustomInputField(
          iconPath: AppImagesSVG.folderCloud,
          child: TextFormField(
            decoration: InputDecoration().copyWith(
              hintText: "File upload",
              suffixIcon: Icon(
                Icons.arrow_drop_down,
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 16.0,
                minHeight: 16.0,
              ),
            ),
            controller: fileUploadController,
            readOnly: true,
            onTap: () => viewModel.fileUpload(),
            keyboardType: TextInputType.name,
          ),
          // child: TextFormField(
          //   decoration: InputDecoration().copyWith(hintText: "File upload"),

          //   controller: fileUploadController,
          //   // values: ["First bank", "Union bank"],
          // ),
          errorText: viewModel.fileUploadValidationMessage,
        ),

        24.verticalSpace,
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: viewModel.termsAccepted,
              onChanged: viewModel.toggleTerms,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By completing this form you agree to ',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        color: Color(0xFF03B98F),
                        fontSize: 12,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                        decorationColor: Color(0xFF03B98F),
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' of ',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Conditions',
                      style: TextStyle(
                        color: Color(0xFF03B98F),
                        fontSize: 12,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                        decorationColor: Color(0xFF03B98F),
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' of this cooperative society',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
