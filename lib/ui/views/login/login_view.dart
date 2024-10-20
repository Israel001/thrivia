import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/ui/views/create_account/create_account_viewmodel.dart';

import '../../common/constants.dart';
import '../../common/input_field.dart';
import '../../common/primary_button.dart';
import '../../common/ui_helpers.dart';
import '../onboarding/onboarding_view.dart';
import 'login_viewmodel.dart';

@FormView(autoTextFieldValidation: false, fields: [
  FormTextField(
    name: "email-phoneNumber",
  ),
  FormTextField(
    name: "password",
  ),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
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
                  decoration: InputDecoration().copyWith(labelText: "Pin"),
                  controller: pinController,
                ),
                errorText: viewModel.pinValidationMessage,
              ),

              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  )),
              Spacer(),
              PrimaryButton(
                  onPressed: () {
                    viewModel.buttonPress();
                  },
                  label: "Create account"),
              verticalSpace(24),
              SwitchSignInType(
                onLoginPage: true,
              ),
              verticalSpace(42),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
