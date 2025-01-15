// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_auth/ui/forgot_password/forgot_password_view.form.dart';
import 'package:thrivia_app/ui/widgets/input_field.dart';
import 'package:thrivia_app/ui/widgets/model_error_display.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

import '../../../common/constants.dart';
import 'forgot_password_viewmodel.dart';

@FormView(autoTextFieldValidation: false, fields: [
  FormTextField(
    name: "email-phoneNumber",
    validator: FormValidators.validateEmailOrPhoneNumber,
  ),
  FormTextField(
    name: "password",
    validator: FormValidators.validatePassword,
  ),
])
class ForgotPasswordView extends StackedView<ForgotPasswordViewModel>
    with $ForgotPasswordView {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotPasswordViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SafeArea(
          child: PageView(
            controller: viewModel.controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ResetPasswordWidget(
                viewModel: viewModel,
                emailPhoneNumberController: emailPhoneNumberController,
              ),
              NewPasswordWidget(
                passwordController: passwordController,
                viewModel: viewModel,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(ForgotPasswordViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ForgotPasswordViewModel viewModel) {
    super.onViewModelReady(viewModel);

    syncFormWithViewModel(viewModel);
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotPasswordViewModel();
}

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    Key? key,
    required this.emailPhoneNumberController,
    required this.viewModel,
  }) : super(key: key);

  final TextEditingController emailPhoneNumberController;
  final ForgotPasswordViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reset Password',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // email /phone number
        CustomInputField(
          iconPath: AppImagesSVG.user,
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration:
                InputDecoration().copyWith(labelText: "Phone number or Email"),
            controller: emailPhoneNumberController,
          ),
          errorText: viewModel.emailPhoneNumberValidationMessage,
        ),
        ModelErrorDisplay(viewModel: viewModel),
        verticalSpace(24),
        PrimaryButton(
          onPressed: viewModel.initiateResetPassword,
          label: "Reset Password",
          loading: viewModel.isBusy,
        ),
      ],
    );
  }
}

class NewPasswordWidget extends StatelessWidget {
  const NewPasswordWidget({
    Key? key,
    required this.passwordController,
    required this.viewModel,
  }) : super(key: key);

  final TextEditingController passwordController;
  final ForgotPasswordViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New Password',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        //password
        CustomInputField(
          iconPath: AppImagesSVG.lock,
          child: TextFormField(
            keyboardType: TextInputType.number,
            obscureText: true,
            decoration: InputDecoration().copyWith(labelText: "Pin"),
            controller: passwordController,
          ),
          errorText: viewModel.passwordValidationMessage,
        ),
        ModelErrorDisplay(viewModel: viewModel),
        verticalSpace(24),
        PrimaryButton(
          onPressed: viewModel.resetPassword,
          label: "Reset Password",
          loading: viewModel.isBusy,
        ),
      ],
    );
  }
}
