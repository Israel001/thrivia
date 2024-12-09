import 'package:flutter/material.dart' hide FormField;
import 'package:flutter/material.dart' as Material show FormField;

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/pages/page0.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/pages/page1.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/pages/page2.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/pages/page3.dart';
import 'package:thrivia_app/ui/widgets/dropdown_form_field.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'join_cooperative_view.form.dart';
import 'join_cooperative_viewmodel.dart';

enum PaymentMethod {
  wallet("Thrivia wallet"),
  bankAccount("Bank account");

  final String label;
  const PaymentMethod(this.label);

  @override
  String toString() {
    return label;
  }
}

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: "cooperativeId",
      validator: FormValidators.validateCooperativeId,
    ),
    FormTextField(
        name: "membershipNumber",
        validator: FormValidators.validateMembershipNumber),
    FormTextField(name: "fullName", validator: FormValidators.validateFullName),
    FormTextField(
        name: "dateOfBirth", validator: FormValidators.validateDateOfBirth),
    FormTextField(
        name: "phoneNumber", validator: FormValidators.validatePhoneNumber),
    FormTextField(
        name: "emailAddress", validator: FormValidators.validateEmail),
    FormTextField(
        name: "residentialAddres",
        validator: FormValidators.validateHouseAddress),
    FormTextField(
        name: "paymentMethod", validator: FormValidators.validateDropDown),
    FormTextField(name: "bank", validator: FormValidators.validateDropDown),
    FormTextField(
        name: "accountNumber", validator: FormValidators.validatePhoneNumber),
    FormTextField(name: "accountName", validator: FormValidators.validateName),
    FormTextField(name: "idType", validator: FormValidators.validateDropDown),
    FormTextField(
        name: "fileUpload", validator: FormValidators.validateDropDown),
    // FormDropdownField(name: "idType", items: [StaticDropdownItem(title: "", value: value)],),
    // FormField(name: "fileUpload"),
    // FormField(name: "termsAndConditions"),
  ],
)
class JoinCooperativeView extends StackedView<JoinCooperativeViewModel>
    with $JoinCooperativeView {
  const JoinCooperativeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    JoinCooperativeViewModel viewModel,
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
                    Page0(
                      viewModel: viewModel,
                    ),
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
  JoinCooperativeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JoinCooperativeViewModel();

  @override
  void onDispose(JoinCooperativeViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(JoinCooperativeViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }
}
