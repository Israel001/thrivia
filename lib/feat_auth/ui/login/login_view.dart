import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/feat_auth/ui/create_account/create_account_viewmodel.dart';
import 'package:thrivia_app/feat_auth/ui/login/login_view.form.dart';
import 'package:thrivia_app/ui/widgets/model_error_display.dart';
import 'package:thrivia_app/ui/widgets/switch_sign_in_type.dart';

import '../../../common/constants.dart';
import '../../../ui/widgets/input_field.dart';
import '../../../ui/widgets/primary_button.dart';
import '../../../common/ui_helpers.dart';
import '../../../feat_onboarding/ui/onboarding/onboarding_view.dart';
import 'login_viewmodel.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: "email-phoneNumber",
      validator: FormValidators.validateEmailOrPhoneNumber,
    ),
    FormTextField(
      name: "password",
      validator: FormValidators.validatePassword,
    ),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(Size(double.infinity, 812)),
            child: Container(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(42),
                  // logo
                  Image.asset(
                    appLogoPath(context),
                    height: 55,
                  ),
                  verticalSpace(60),

                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Let’s thrive together",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  verticalSpace(30),

                  // email /phone number
                  CustomInputField(
                    iconPath: AppImagesSVG.user,
                    child: TextFormField(
                      decoration: InputDecoration()
                          .copyWith(labelText: "Phone number or Email"),
                      controller: emailPhoneNumberController,
                    ),
                    errorText: viewModel.emailPhoneNumberValidationMessage,
                  ),

                  //password
                  CustomInputField(
                    iconPath: AppImagesSVG.lock,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration().copyWith(labelText: "Pin"),
                      controller: passwordController,
                    ),
                    errorText: viewModel.passwordValidationMessage,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )),
                  ),
                  ModelErrorDisplay(viewModel: viewModel),
                  Spacer(),
                  PrimaryButton(
                    onPressed: viewModel.buttonPress,
                    label: "Login",
                    loading: viewModel.isBusy,
                  ),
                  verticalSpace(24),
                  SwitchSignInType(
                    onLoginPage: true,
                  ),
                  verticalSpace(42),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
