// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/common/form_validators.dart';

const bool _autoTextFieldValidation = false;

const String EmailPhoneNumberValueKey = 'email-phoneNumber';
const String PasswordValueKey = 'password';

final Map<String, TextEditingController>
    _ForgotPasswordViewTextEditingControllers = {};

final Map<String, FocusNode> _ForgotPasswordViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ForgotPasswordViewTextValidations = {
  EmailPhoneNumberValueKey: FormValidators.validateEmailOrPhoneNumber,
  PasswordValueKey: FormValidators.validatePassword,
};

mixin $ForgotPasswordView {
  TextEditingController get emailPhoneNumberController =>
      _getFormTextEditingController(EmailPhoneNumberValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);

  FocusNode get emailPhoneNumberFocusNode =>
      _getFormFocusNode(EmailPhoneNumberValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ForgotPasswordViewTextEditingControllers.containsKey(key)) {
      return _ForgotPasswordViewTextEditingControllers[key]!;
    }

    _ForgotPasswordViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ForgotPasswordViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ForgotPasswordViewFocusNodes.containsKey(key)) {
      return _ForgotPasswordViewFocusNodes[key]!;
    }
    _ForgotPasswordViewFocusNodes[key] = FocusNode();
    return _ForgotPasswordViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    emailPhoneNumberController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    emailPhoneNumberController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          EmailPhoneNumberValueKey: emailPhoneNumberController.text,
          PasswordValueKey: passwordController.text,
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

    for (var controller in _ForgotPasswordViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ForgotPasswordViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ForgotPasswordViewTextEditingControllers.clear();
    _ForgotPasswordViewFocusNodes.clear();
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

  String? get emailPhoneNumberValue =>
      this.formValueMap[EmailPhoneNumberValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  set emailPhoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailPhoneNumberValueKey: value}),
    );

    if (_ForgotPasswordViewTextEditingControllers.containsKey(
        EmailPhoneNumberValueKey)) {
      _ForgotPasswordViewTextEditingControllers[EmailPhoneNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_ForgotPasswordViewTextEditingControllers.containsKey(
        PasswordValueKey)) {
      _ForgotPasswordViewTextEditingControllers[PasswordValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasEmailPhoneNumber =>
      this.formValueMap.containsKey(EmailPhoneNumberValueKey) &&
      (emailPhoneNumberValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasEmailPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[EmailPhoneNumberValueKey]?.isNotEmpty ??
      false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get emailPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[EmailPhoneNumberValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
}

extension Methods on FormStateHelper {
  setEmailPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailPhoneNumberValueKey] =
          validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    emailPhoneNumberValue = '';
    passwordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      EmailPhoneNumberValueKey: getValidationMessage(EmailPhoneNumberValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ForgotPasswordViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ForgotPasswordViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      EmailPhoneNumberValueKey: getValidationMessage(EmailPhoneNumberValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
