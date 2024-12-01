import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/pages/page1.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/pages/page2.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/pages/page3.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/register_cooperative/register_cooperative_view.form.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

import 'register_cooperative_viewmodel.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: "cooperativeId",
      // validator: FormValidators.validateEmailOrPhoneNumber,
    ),
    FormTextField(
      name: "cooperativeName",
      // validator: FormValidators.validatePassword,
    ),
    FormTextField(name: "businessRegNumber"),
    FormTextField(name: "businessAddress"),
    FormTextField(name: "emailAdress"),
    FormTextField(name: "phoneNumber"),
    FormTextField(name: "transactionMethod"),
    FormTextField(name: "bank"),
    FormTextField(name: "acountNumber"),
    FormTextField(name: "accountName"),
    FormTextField(name: "idType"),
    FormTextField(name: "fileUpload"),
  ],
)
class RegisterCooperativeView extends StackedView<RegisterCooperativeViewModel>
    with $RegisterCooperativeView {
  const RegisterCooperativeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterCooperativeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: viewModel.pageController,
                  // physics: NeverScrollableScrollPhysics(),
                  children: [
                    Page1(
                      viewModel: viewModel,
                    ),
                    Page2(
                      viewModel: viewModel,
                    ),
                    Page3(
                      viewModel: viewModel,
                    ),
                  ]
                      .map((element) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: SingleChildScrollView(
                              child: element,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    PrimaryButton(
                      onPressed: viewModel.proceed,
                      label: "Proceed",
                    ),
                    16.verticalSpace,
                    SecondaryButton(
                      onPressed: viewModel.cancel,
                      label: "Cancel",
                    ),
                    50.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  RegisterCooperativeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterCooperativeViewModel();
}
