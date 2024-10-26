import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';
import 'package:thrivia_app/ui/widgets/model_error_display.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_onboarding/ui/onboarding/onboarding_view.dart';
import 'package:thrivia_app/ui/widgets/switch_sign_in_type.dart';

import 'create_account_viewmodel.dart';

import 'create_account_view.form.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: "firstName",
      validator: FormValidators.validateName,
    ),
    FormTextField(
      name: "lastName",
      validator: FormValidators.validateName,
    ),
    FormTextField(
      name: "phoneNumber",
      validator: FormValidators.validatePhoneNumber,
    ),
    FormTextField(
      name: "emailAddress",
      validator: FormValidators.validateEmail,
    ),
    FormTextField(
      name: "pin",
      validator: FormValidators.validatePassword,
    ),
    FormTextField(
      name: "pin_confirm",
      validator: FormValidators.validateConfirmPassword,
    ),
    FormTextField(
      name: "bvn",
      validator: FormValidators.validateBVNANDNIN,
    ),
    FormTextField(
      name: "nin",
      validator: FormValidators.validateBVNANDNIN,
    ),
  ],
)
class CreateAccountView extends StackedView<CreateAccountViewModel>
    with $CreateAccountView {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateAccountViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              children: [
                verticalSpace(42),
                // logo
                Image.asset(
                  appLogoPath(context),
                  height: 55,
                ),
                verticalSpace(60),

                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'To get started with us, create a free account',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                verticalSpace(30),

                // firstName
                CustomInputField(
                  iconPath: AppImagesSVG.user,
                  errorText: viewModel.firstNameValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration()
                        .copyWith(labelText: "First name"),
                    controller: firstNameController,
                  ),
                ),

                // lastName
                CustomInputField(
                  iconPath: AppImagesSVG.user,
                  errorText: viewModel.lastNameValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration()
                        .copyWith(labelText: "Last name"),
                    controller: lastNameController,
                  ),
                ),

                // phoneNumber
                CustomInputField(
                  iconPath: AppImagesSVG.call,
                  errorText: viewModel.phoneNumberValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration().copyWith(
                      // labelText: "Phone number",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      // floatingLabelAlignment: ,
                      labelText: "Phone number",
                    ),
                    controller: phoneNumberController,
                  ),
                ),

                //emailAddress
                CustomInputField(
                  iconPath: AppImagesSVG.smsEdit,
                  errorText: viewModel.emailAddressValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration()
                        .copyWith(labelText: "Email address"),
                    controller: emailAddressController,
                  ),
                ),

                //password
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  errorText: viewModel.pinValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration()
                        .copyWith(labelText: "Create pin"),
                    controller: pinController,
                  ),
                ),

                //confirm password
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  errorText: viewModel.pinConfirmValidationMessage,
                  child: TextFormField(
                    decoration: const InputDecoration()
                        .copyWith(labelText: "Confirm pin"),
                    controller: pinConfirmController,
                  ),
                ),

                //BVN
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  errorText: viewModel.bvnValidationMessage,
                  child: TextFormField(
                    decoration:
                        const InputDecoration().copyWith(labelText: "BVN"),
                    controller: bvnController,
                  ),
                ),

                //NIN
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  errorText: viewModel.ninValidationMessage,
                  child: TextFormField(
                    decoration:
                        const InputDecoration().copyWith(labelText: "NIN"),
                    controller: ninController,
                  ),
                ),

                ModelErrorDisplay(
                  viewModel: viewModel,
                ),
                verticalSpace(53),

                PrimaryButton(
                    onPressed: () {
                      viewModel.buttonPress();
                    },
                    loading: viewModel.isBusy,
                    label: "Create account"),
                verticalSpace(24),
                const SwitchSignInType(
                  onLoginPage: false,
                ),
                verticalSpace(42),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreateAccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateAccountViewModel();
  @override
  void onDispose(CreateAccountViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(CreateAccountViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }
}
