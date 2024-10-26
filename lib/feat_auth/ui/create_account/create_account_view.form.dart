// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/common/form_validators.dart';

const bool _autoTextFieldValidation = false;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String EmailAddressValueKey = 'emailAddress';
const String PinValueKey = 'pin';
const String PinConfirmValueKey = 'pin_confirm';
const String BvnValueKey = 'bvn';
const String NinValueKey = 'nin';

final Map<String, TextEditingController>
    _CreateAccountViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateAccountViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAccountViewTextValidations = {
  FirstNameValueKey: FormValidators.validateName,
  LastNameValueKey: FormValidators.validateName,
  PhoneNumberValueKey: FormValidators.validatePhoneNumber,
  EmailAddressValueKey: FormValidators.validateEmail,
  PinValueKey: FormValidators.validatePassword,
  PinConfirmValueKey: FormValidators.validateConfirmPassword,
  BvnValueKey: FormValidators.validateBVNANDNIN,
  NinValueKey: FormValidators.validateBVNANDNIN,
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
  TextEditingController get pinController =>
      _getFormTextEditingController(PinValueKey);
  TextEditingController get pinConfirmController =>
      _getFormTextEditingController(PinConfirmValueKey);
  TextEditingController get bvnController =>
      _getFormTextEditingController(BvnValueKey);
  TextEditingController get ninController =>
      _getFormTextEditingController(NinValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get emailAddressFocusNode =>
      _getFormFocusNode(EmailAddressValueKey);
  FocusNode get pinFocusNode => _getFormFocusNode(PinValueKey);
  FocusNode get pinConfirmFocusNode => _getFormFocusNode(PinConfirmValueKey);
  FocusNode get bvnFocusNode => _getFormFocusNode(BvnValueKey);
  FocusNode get ninFocusNode => _getFormFocusNode(NinValueKey);

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
    pinController.addListener(() => _updateFormData(model));
    pinConfirmController.addListener(() => _updateFormData(model));
    bvnController.addListener(() => _updateFormData(model));
    ninController.addListener(() => _updateFormData(model));

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
    pinController.addListener(() => _updateFormData(model));
    pinConfirmController.addListener(() => _updateFormData(model));
    bvnController.addListener(() => _updateFormData(model));
    ninController.addListener(() => _updateFormData(model));

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
          PinValueKey: pinController.text,
          PinConfirmValueKey: pinConfirmController.text,
          BvnValueKey: bvnController.text,
          NinValueKey: ninController.text,
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
  String? get pinValue => this.formValueMap[PinValueKey] as String?;
  String? get pinConfirmValue =>
      this.formValueMap[PinConfirmValueKey] as String?;
  String? get bvnValue => this.formValueMap[BvnValueKey] as String?;
  String? get ninValue => this.formValueMap[NinValueKey] as String?;

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

  set pinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PinValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(PinValueKey)) {
      _CreateAccountViewTextEditingControllers[PinValueKey]?.text = value ?? '';
    }
  }

  set pinConfirmValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PinConfirmValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(
        PinConfirmValueKey)) {
      _CreateAccountViewTextEditingControllers[PinConfirmValueKey]?.text =
          value ?? '';
    }
  }

  set bvnValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BvnValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(BvnValueKey)) {
      _CreateAccountViewTextEditingControllers[BvnValueKey]?.text = value ?? '';
    }
  }

  set ninValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NinValueKey: value}),
    );

    if (_CreateAccountViewTextEditingControllers.containsKey(NinValueKey)) {
      _CreateAccountViewTextEditingControllers[NinValueKey]?.text = value ?? '';
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
  bool get hasPin =>
      this.formValueMap.containsKey(PinValueKey) &&
      (pinValue?.isNotEmpty ?? false);
  bool get hasPinConfirm =>
      this.formValueMap.containsKey(PinConfirmValueKey) &&
      (pinConfirmValue?.isNotEmpty ?? false);
  bool get hasBvn =>
      this.formValueMap.containsKey(BvnValueKey) &&
      (bvnValue?.isNotEmpty ?? false);
  bool get hasNin =>
      this.formValueMap.containsKey(NinValueKey) &&
      (ninValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasEmailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey]?.isNotEmpty ?? false;
  bool get hasPinValidationMessage =>
      this.fieldsValidationMessages[PinValueKey]?.isNotEmpty ?? false;
  bool get hasPinConfirmValidationMessage =>
      this.fieldsValidationMessages[PinConfirmValueKey]?.isNotEmpty ?? false;
  bool get hasBvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey]?.isNotEmpty ?? false;
  bool get hasNinValidationMessage =>
      this.fieldsValidationMessages[NinValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get emailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey];
  String? get pinValidationMessage =>
      this.fieldsValidationMessages[PinValueKey];
  String? get pinConfirmValidationMessage =>
      this.fieldsValidationMessages[PinConfirmValueKey];
  String? get bvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey];
  String? get ninValidationMessage =>
      this.fieldsValidationMessages[NinValueKey];
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
  setPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PinValueKey] = validationMessage;
  setPinConfirmValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PinConfirmValueKey] = validationMessage;
  setBvnValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BvnValueKey] = validationMessage;
  setNinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NinValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    phoneNumberValue = '';
    emailAddressValue = '';
    pinValue = '';
    pinConfirmValue = '';
    bvnValue = '';
    ninValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
      PinValueKey: getValidationMessage(PinValueKey),
      PinConfirmValueKey: getValidationMessage(PinConfirmValueKey),
      BvnValueKey: getValidationMessage(BvnValueKey),
      NinValueKey: getValidationMessage(NinValueKey),
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
      PinValueKey: getValidationMessage(PinValueKey),
      PinConfirmValueKey: getValidationMessage(PinConfirmValueKey),
      BvnValueKey: getValidationMessage(BvnValueKey),
      NinValueKey: getValidationMessage(NinValueKey),
    });
