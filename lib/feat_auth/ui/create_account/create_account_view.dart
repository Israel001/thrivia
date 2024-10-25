import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/constants.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_onboarding/ui/onboarding/onboarding_view.dart';

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

                Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
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
                  child: TextFormField(
                    decoration:
                        InputDecoration().copyWith(labelText: "First name"),
                    controller: firstNameController,
                  ),
                  errorText: viewModel.firstNameValidationMessage,
                ),

                // lastName
                CustomInputField(
                  iconPath: AppImagesSVG.user,
                  child: TextFormField(
                    decoration:
                        InputDecoration().copyWith(labelText: "Last name"),
                    controller: lastNameController,
                  ),
                  errorText: viewModel.lastNameValidationMessage,
                ),

                // phoneNumber
                CustomInputField(
                  iconPath: AppImagesSVG.call,
                  child: TextFormField(
                    decoration: InputDecoration().copyWith(
                      // labelText: "Phone number",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      // floatingLabelAlignment: ,
                      labelText: "Phone number",
                    ),
                    controller: phoneNumberController,
                  ),
                  errorText: viewModel.phoneNumberValidationMessage,
                ),

                //emailAddress
                CustomInputField(
                  iconPath: AppImagesSVG.smsEdit,
                  child: TextFormField(
                    decoration:
                        InputDecoration().copyWith(labelText: "Email address"),
                    controller: emailAddressController,
                  ),
                  errorText: viewModel.emailAddressValidationMessage,
                ),

                //password
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  child: TextFormField(
                    decoration:
                        InputDecoration().copyWith(labelText: "Create pin"),
                    controller: pinController,
                  ),
                  errorText: viewModel.pinValidationMessage,
                ),

                //confirm password
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  child: TextFormField(
                    decoration:
                        InputDecoration().copyWith(labelText: "Confirm pin"),
                    controller: pinConfirmController,
                  ),
                  errorText: viewModel.pinConfirmValidationMessage,
                ),

                //BVN
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  child: TextFormField(
                    decoration: InputDecoration().copyWith(labelText: "BVN"),
                    controller: bvnController,
                  ),
                  errorText: viewModel.bvnValidationMessage,
                ),

                //NIN
                CustomInputField(
                  iconPath: AppImagesSVG.lock,
                  child: TextFormField(
                    decoration: InputDecoration().copyWith(labelText: "NIN"),
                    controller: ninController,
                  ),
                  errorText: viewModel.ninValidationMessage,
                ),
                if (viewModel.validationMessage != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 45),
                    child: Text(
                      viewModel.validationMessage!,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.error),
                    ),
                  ),
                verticalSpace(53),
                PrimaryButton(
                    onPressed: () {
                      viewModel.buttonPress();
                    },
                    label: "Create account"),
                verticalSpace(24),
                SwitchSignInType(
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
