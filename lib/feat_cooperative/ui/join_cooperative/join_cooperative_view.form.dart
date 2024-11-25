// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String CooperativeIdValueKey = 'cooperativeId';
const String MembershipNumberValueKey = 'membershipNumber';
const String FullNameValueKey = 'fullName';
const String DateOfBirthValueKey = 'dateOfBirth';
const String PhoneNumberValueKey = 'phoneNumber';
const String EmailAddressValueKey = 'emailAddress';
const String ResidentialAddressValueKey = 'residentialAddress';
const String PaymentMethodValueKey = 'paymentMethod';
const String BankValueKey = 'bank';
const String AccountNumberValueKey = 'accountNumber';
const String AccountNameValueKey = 'accountName';
const String IdTypeValueKey = 'idType';
const String FileUploadValueKey = 'fileUpload';

final Map<String, TextEditingController>
    _JoinCooperativeViewTextEditingControllers = {};

final Map<String, FocusNode> _JoinCooperativeViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _JoinCooperativeViewTextValidations = {
  CooperativeIdValueKey: null,
  MembershipNumberValueKey: null,
  FullNameValueKey: null,
  DateOfBirthValueKey: null,
  PhoneNumberValueKey: null,
  EmailAddressValueKey: null,
  ResidentialAddressValueKey: null,
  PaymentMethodValueKey: null,
  BankValueKey: null,
  AccountNumberValueKey: null,
  AccountNameValueKey: null,
  IdTypeValueKey: null,
  FileUploadValueKey: null,
};

mixin $JoinCooperativeView {
  TextEditingController get cooperativeIdController =>
      _getFormTextEditingController(CooperativeIdValueKey);
  TextEditingController get membershipNumberController =>
      _getFormTextEditingController(MembershipNumberValueKey);
  TextEditingController get fullNameController =>
      _getFormTextEditingController(FullNameValueKey);
  TextEditingController get dateOfBirthController =>
      _getFormTextEditingController(DateOfBirthValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get emailAddressController =>
      _getFormTextEditingController(EmailAddressValueKey);
  TextEditingController get residentialAddressController =>
      _getFormTextEditingController(ResidentialAddressValueKey);
  TextEditingController get paymentMethodController =>
      _getFormTextEditingController(PaymentMethodValueKey);
  TextEditingController get bankController =>
      _getFormTextEditingController(BankValueKey);
  TextEditingController get accountNumberController =>
      _getFormTextEditingController(AccountNumberValueKey);
  TextEditingController get accountNameController =>
      _getFormTextEditingController(AccountNameValueKey);
  TextEditingController get idTypeController =>
      _getFormTextEditingController(IdTypeValueKey);
  TextEditingController get fileUploadController =>
      _getFormTextEditingController(FileUploadValueKey);

  FocusNode get cooperativeIdFocusNode =>
      _getFormFocusNode(CooperativeIdValueKey);
  FocusNode get membershipNumberFocusNode =>
      _getFormFocusNode(MembershipNumberValueKey);
  FocusNode get fullNameFocusNode => _getFormFocusNode(FullNameValueKey);
  FocusNode get dateOfBirthFocusNode => _getFormFocusNode(DateOfBirthValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get emailAddressFocusNode =>
      _getFormFocusNode(EmailAddressValueKey);
  FocusNode get residentialAddressFocusNode =>
      _getFormFocusNode(ResidentialAddressValueKey);
  FocusNode get paymentMethodFocusNode =>
      _getFormFocusNode(PaymentMethodValueKey);
  FocusNode get bankFocusNode => _getFormFocusNode(BankValueKey);
  FocusNode get accountNumberFocusNode =>
      _getFormFocusNode(AccountNumberValueKey);
  FocusNode get accountNameFocusNode => _getFormFocusNode(AccountNameValueKey);
  FocusNode get idTypeFocusNode => _getFormFocusNode(IdTypeValueKey);
  FocusNode get fileUploadFocusNode => _getFormFocusNode(FileUploadValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_JoinCooperativeViewTextEditingControllers.containsKey(key)) {
      return _JoinCooperativeViewTextEditingControllers[key]!;
    }

    _JoinCooperativeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _JoinCooperativeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_JoinCooperativeViewFocusNodes.containsKey(key)) {
      return _JoinCooperativeViewFocusNodes[key]!;
    }
    _JoinCooperativeViewFocusNodes[key] = FocusNode();
    return _JoinCooperativeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    cooperativeIdController.addListener(() => _updateFormData(model));
    membershipNumberController.addListener(() => _updateFormData(model));
    fullNameController.addListener(() => _updateFormData(model));
    dateOfBirthController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailAddressController.addListener(() => _updateFormData(model));
    residentialAddressController.addListener(() => _updateFormData(model));
    paymentMethodController.addListener(() => _updateFormData(model));
    bankController.addListener(() => _updateFormData(model));
    accountNumberController.addListener(() => _updateFormData(model));
    accountNameController.addListener(() => _updateFormData(model));
    idTypeController.addListener(() => _updateFormData(model));
    fileUploadController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    cooperativeIdController.addListener(() => _updateFormData(model));
    membershipNumberController.addListener(() => _updateFormData(model));
    fullNameController.addListener(() => _updateFormData(model));
    dateOfBirthController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailAddressController.addListener(() => _updateFormData(model));
    residentialAddressController.addListener(() => _updateFormData(model));
    paymentMethodController.addListener(() => _updateFormData(model));
    bankController.addListener(() => _updateFormData(model));
    accountNumberController.addListener(() => _updateFormData(model));
    accountNameController.addListener(() => _updateFormData(model));
    idTypeController.addListener(() => _updateFormData(model));
    fileUploadController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CooperativeIdValueKey: cooperativeIdController.text,
          MembershipNumberValueKey: membershipNumberController.text,
          FullNameValueKey: fullNameController.text,
          DateOfBirthValueKey: dateOfBirthController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          EmailAddressValueKey: emailAddressController.text,
          ResidentialAddressValueKey: residentialAddressController.text,
          PaymentMethodValueKey: paymentMethodController.text,
          BankValueKey: bankController.text,
          AccountNumberValueKey: accountNumberController.text,
          AccountNameValueKey: accountNameController.text,
          IdTypeValueKey: idTypeController.text,
          FileUploadValueKey: fileUploadController.text,
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

    for (var controller in _JoinCooperativeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _JoinCooperativeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _JoinCooperativeViewTextEditingControllers.clear();
    _JoinCooperativeViewFocusNodes.clear();
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

  String? get cooperativeIdValue =>
      this.formValueMap[CooperativeIdValueKey] as String?;
  String? get membershipNumberValue =>
      this.formValueMap[MembershipNumberValueKey] as String?;
  String? get fullNameValue => this.formValueMap[FullNameValueKey] as String?;
  String? get dateOfBirthValue =>
      this.formValueMap[DateOfBirthValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get emailAddressValue =>
      this.formValueMap[EmailAddressValueKey] as String?;
  String? get residentialAddressValue =>
      this.formValueMap[ResidentialAddressValueKey] as String?;
  String? get paymentMethodValue =>
      this.formValueMap[PaymentMethodValueKey] as String?;
  String? get bankValue => this.formValueMap[BankValueKey] as String?;
  String? get accountNumberValue =>
      this.formValueMap[AccountNumberValueKey] as String?;
  String? get accountNameValue =>
      this.formValueMap[AccountNameValueKey] as String?;
  String? get idTypeValue => this.formValueMap[IdTypeValueKey] as String?;
  String? get fileUploadValue =>
      this.formValueMap[FileUploadValueKey] as String?;

  set cooperativeIdValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CooperativeIdValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        CooperativeIdValueKey)) {
      _JoinCooperativeViewTextEditingControllers[CooperativeIdValueKey]?.text =
          value ?? '';
    }
  }

  set membershipNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MembershipNumberValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        MembershipNumberValueKey)) {
      _JoinCooperativeViewTextEditingControllers[MembershipNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set fullNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FullNameValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        FullNameValueKey)) {
      _JoinCooperativeViewTextEditingControllers[FullNameValueKey]?.text =
          value ?? '';
    }
  }

  set dateOfBirthValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DateOfBirthValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        DateOfBirthValueKey)) {
      _JoinCooperativeViewTextEditingControllers[DateOfBirthValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _JoinCooperativeViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set emailAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailAddressValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        EmailAddressValueKey)) {
      _JoinCooperativeViewTextEditingControllers[EmailAddressValueKey]?.text =
          value ?? '';
    }
  }

  set residentialAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ResidentialAddressValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        ResidentialAddressValueKey)) {
      _JoinCooperativeViewTextEditingControllers[ResidentialAddressValueKey]
          ?.text = value ?? '';
    }
  }

  set paymentMethodValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PaymentMethodValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        PaymentMethodValueKey)) {
      _JoinCooperativeViewTextEditingControllers[PaymentMethodValueKey]?.text =
          value ?? '';
    }
  }

  set bankValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BankValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(BankValueKey)) {
      _JoinCooperativeViewTextEditingControllers[BankValueKey]?.text =
          value ?? '';
    }
  }

  set accountNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AccountNumberValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        AccountNumberValueKey)) {
      _JoinCooperativeViewTextEditingControllers[AccountNumberValueKey]?.text =
          value ?? '';
    }
  }

  set accountNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AccountNameValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        AccountNameValueKey)) {
      _JoinCooperativeViewTextEditingControllers[AccountNameValueKey]?.text =
          value ?? '';
    }
  }

  set idTypeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IdTypeValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        IdTypeValueKey)) {
      _JoinCooperativeViewTextEditingControllers[IdTypeValueKey]?.text =
          value ?? '';
    }
  }

  set fileUploadValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FileUploadValueKey: value}),
    );

    if (_JoinCooperativeViewTextEditingControllers.containsKey(
        FileUploadValueKey)) {
      _JoinCooperativeViewTextEditingControllers[FileUploadValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasCooperativeId =>
      this.formValueMap.containsKey(CooperativeIdValueKey) &&
      (cooperativeIdValue?.isNotEmpty ?? false);
  bool get hasMembershipNumber =>
      this.formValueMap.containsKey(MembershipNumberValueKey) &&
      (membershipNumberValue?.isNotEmpty ?? false);
  bool get hasFullName =>
      this.formValueMap.containsKey(FullNameValueKey) &&
      (fullNameValue?.isNotEmpty ?? false);
  bool get hasDateOfBirth =>
      this.formValueMap.containsKey(DateOfBirthValueKey) &&
      (dateOfBirthValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasEmailAddress =>
      this.formValueMap.containsKey(EmailAddressValueKey) &&
      (emailAddressValue?.isNotEmpty ?? false);
  bool get hasResidentialAddress =>
      this.formValueMap.containsKey(ResidentialAddressValueKey) &&
      (residentialAddressValue?.isNotEmpty ?? false);
  bool get hasPaymentMethod =>
      this.formValueMap.containsKey(PaymentMethodValueKey) &&
      (paymentMethodValue?.isNotEmpty ?? false);
  bool get hasBank =>
      this.formValueMap.containsKey(BankValueKey) &&
      (bankValue?.isNotEmpty ?? false);
  bool get hasAccountNumber =>
      this.formValueMap.containsKey(AccountNumberValueKey) &&
      (accountNumberValue?.isNotEmpty ?? false);
  bool get hasAccountName =>
      this.formValueMap.containsKey(AccountNameValueKey) &&
      (accountNameValue?.isNotEmpty ?? false);
  bool get hasIdType =>
      this.formValueMap.containsKey(IdTypeValueKey) &&
      (idTypeValue?.isNotEmpty ?? false);
  bool get hasFileUpload =>
      this.formValueMap.containsKey(FileUploadValueKey) &&
      (fileUploadValue?.isNotEmpty ?? false);

  bool get hasCooperativeIdValidationMessage =>
      this.fieldsValidationMessages[CooperativeIdValueKey]?.isNotEmpty ?? false;
  bool get hasMembershipNumberValidationMessage =>
      this.fieldsValidationMessages[MembershipNumberValueKey]?.isNotEmpty ??
      false;
  bool get hasFullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey]?.isNotEmpty ?? false;
  bool get hasDateOfBirthValidationMessage =>
      this.fieldsValidationMessages[DateOfBirthValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasEmailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey]?.isNotEmpty ?? false;
  bool get hasResidentialAddressValidationMessage =>
      this.fieldsValidationMessages[ResidentialAddressValueKey]?.isNotEmpty ??
      false;
  bool get hasPaymentMethodValidationMessage =>
      this.fieldsValidationMessages[PaymentMethodValueKey]?.isNotEmpty ?? false;
  bool get hasBankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey]?.isNotEmpty ?? false;
  bool get hasAccountNumberValidationMessage =>
      this.fieldsValidationMessages[AccountNumberValueKey]?.isNotEmpty ?? false;
  bool get hasAccountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey]?.isNotEmpty ?? false;
  bool get hasIdTypeValidationMessage =>
      this.fieldsValidationMessages[IdTypeValueKey]?.isNotEmpty ?? false;
  bool get hasFileUploadValidationMessage =>
      this.fieldsValidationMessages[FileUploadValueKey]?.isNotEmpty ?? false;

  String? get cooperativeIdValidationMessage =>
      this.fieldsValidationMessages[CooperativeIdValueKey];
  String? get membershipNumberValidationMessage =>
      this.fieldsValidationMessages[MembershipNumberValueKey];
  String? get fullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey];
  String? get dateOfBirthValidationMessage =>
      this.fieldsValidationMessages[DateOfBirthValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get emailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey];
  String? get residentialAddressValidationMessage =>
      this.fieldsValidationMessages[ResidentialAddressValueKey];
  String? get paymentMethodValidationMessage =>
      this.fieldsValidationMessages[PaymentMethodValueKey];
  String? get bankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey];
  String? get accountNumberValidationMessage =>
      this.fieldsValidationMessages[AccountNumberValueKey];
  String? get accountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey];
  String? get idTypeValidationMessage =>
      this.fieldsValidationMessages[IdTypeValueKey];
  String? get fileUploadValidationMessage =>
      this.fieldsValidationMessages[FileUploadValueKey];
}

extension Methods on FormStateHelper {
  setCooperativeIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CooperativeIdValueKey] = validationMessage;
  setMembershipNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MembershipNumberValueKey] =
          validationMessage;
  setFullNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FullNameValueKey] = validationMessage;
  setDateOfBirthValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateOfBirthValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setEmailAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailAddressValueKey] = validationMessage;
  setResidentialAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ResidentialAddressValueKey] =
          validationMessage;
  setPaymentMethodValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PaymentMethodValueKey] = validationMessage;
  setBankValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BankValueKey] = validationMessage;
  setAccountNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNumberValueKey] = validationMessage;
  setAccountNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNameValueKey] = validationMessage;
  setIdTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IdTypeValueKey] = validationMessage;
  setFileUploadValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FileUploadValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    cooperativeIdValue = '';
    membershipNumberValue = '';
    fullNameValue = '';
    dateOfBirthValue = '';
    phoneNumberValue = '';
    emailAddressValue = '';
    residentialAddressValue = '';
    paymentMethodValue = '';
    bankValue = '';
    accountNumberValue = '';
    accountNameValue = '';
    idTypeValue = '';
    fileUploadValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CooperativeIdValueKey: getValidationMessage(CooperativeIdValueKey),
      MembershipNumberValueKey: getValidationMessage(MembershipNumberValueKey),
      FullNameValueKey: getValidationMessage(FullNameValueKey),
      DateOfBirthValueKey: getValidationMessage(DateOfBirthValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
      ResidentialAddressValueKey:
          getValidationMessage(ResidentialAddressValueKey),
      PaymentMethodValueKey: getValidationMessage(PaymentMethodValueKey),
      BankValueKey: getValidationMessage(BankValueKey),
      AccountNumberValueKey: getValidationMessage(AccountNumberValueKey),
      AccountNameValueKey: getValidationMessage(AccountNameValueKey),
      IdTypeValueKey: getValidationMessage(IdTypeValueKey),
      FileUploadValueKey: getValidationMessage(FileUploadValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _JoinCooperativeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _JoinCooperativeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CooperativeIdValueKey: getValidationMessage(CooperativeIdValueKey),
      MembershipNumberValueKey: getValidationMessage(MembershipNumberValueKey),
      FullNameValueKey: getValidationMessage(FullNameValueKey),
      DateOfBirthValueKey: getValidationMessage(DateOfBirthValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
      ResidentialAddressValueKey:
          getValidationMessage(ResidentialAddressValueKey),
      PaymentMethodValueKey: getValidationMessage(PaymentMethodValueKey),
      BankValueKey: getValidationMessage(BankValueKey),
      AccountNumberValueKey: getValidationMessage(AccountNumberValueKey),
      AccountNameValueKey: getValidationMessage(AccountNameValueKey),
      IdTypeValueKey: getValidationMessage(IdTypeValueKey),
      FileUploadValueKey: getValidationMessage(FileUploadValueKey),
    });
