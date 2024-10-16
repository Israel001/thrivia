// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/ui/views/create_account/create_account_viewmodel.dart';

const bool _autoTextFieldValidation = false;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String EmailAddressValueKey = 'emailAddress';
const String PasswordValueKey = 'password';
const String PasswordConfirmValueKey = 'password_confirm';

final Map<String, TextEditingController>
    _CreateAccountViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateAccountViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAccountViewTextValidations = {
  FirstNameValueKey: FormValidators.validateName,
  LastNameValueKey: FormValidators.validateName,
  PhoneNumberValueKey: FormValidators.validatePhoneNumber,
  EmailAddressValueKey: FormValidators.validateEmail,
  PasswordValueKey: FormValidators.validatePassword,
  PasswordConfirmValueKey: FormValidators.validateConfirmPassword,
};

mixin $CreateAccountView {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get emailAddressController =>
      _getFormTextEditingController(EmailAddressValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  TextEditingController get passwordConfirmController =>
      _getFormTextEditingController(PasswordConfirmValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get emailAddressFocusNode =>
      _getFormFocusNode(EmailAddressValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);
  FocusNode get passwordConfirmFocusNode =>
      _getFormFocusNode(PasswordConfirmValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateAccountViewTextEditingControllers.containsKey(key)) {
      return _CreateAccountViewTextEditingControllers[key]!;
    }

    _CreateAccountViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateAccountViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateAccountViewFocusNodes.containsKey(key)) {
      return _CreateAccountViewFocusNodes[key]!;
    }
    _CreateAccountViewFocusNodes[key] = FocusNode();
    return _CreateAccountViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailAddressController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    passwordConfirmController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailAddressController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    passwordConfirmController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          EmailAddressValueKey: emailAddressController.text,
          PasswordValueKey: passwordController.text,
          PasswordConfirmValueKey: passwordConfirmController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateAccountViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateAccountViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateAccountViewTextEditingControllers.clear();
    _CreateAccountViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get emailAddressValue =>
      this.formValueMap[EmailAddressValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;
  String? get passwordConfirmValue =>
      this.formValueMap[PasswordConfirmValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        FirstNameValueKey)) {
      _CreateAccountViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        LastNameValueKey)) {
      _CreateAccountViewTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _CreateAccountViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set emailAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailAddressValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        EmailAddressValueKey)) {
      _CreateAccountViewTextEditingControllers[EmailAddressValueKey]?.text =
          value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        PasswordValueKey)) {
      _CreateAccountViewTextEditingControllers[PasswordValueKey]?.text =
          value ?? '';
    }
  }

  set passwordConfirmValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordConfirmValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        PasswordConfirmValueKey)) {
      _CreateAccountViewTextEditingControllers[PasswordConfirmValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasEmailAddress =>
      this.formValueMap.containsKey(EmailAddressValueKey) &&
      (emailAddressValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);
  bool get hasPasswordConfirm =>
      this.formValueMap.containsKey(PasswordConfirmValueKey) &&
      (passwordConfirmValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasEmailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordConfirmValidationMessage =>
      this.fieldsValidationMessages[PasswordConfirmValueKey]?.isNotEmpty ??
      false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get emailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
  String? get passwordConfirmValidationMessage =>
      this.fieldsValidationMessages[PasswordConfirmValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setEmailAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailAddressValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
  setPasswordConfirmValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordConfirmValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    phoneNumberValue = '';
    emailAddressValue = '';
    passwordValue = '';
    passwordConfirmValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      PasswordConfirmValueKey: getValidationMessage(PasswordConfirmValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateAccountViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateAccountViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      PasswordConfirmValueKey: getValidationMessage(PasswordConfirmValueKey),
    });
