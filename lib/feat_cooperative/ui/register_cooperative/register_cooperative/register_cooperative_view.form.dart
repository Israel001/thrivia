// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String CooperativeIdValueKey = 'cooperativeId';
const String CooperativeNameValueKey = 'cooperativeName';
const String BusinessRegNumberValueKey = 'businessRegNumber';
const String BusinessAddressValueKey = 'businessAddress';
const String EmailAdressValueKey = 'emailAdress';
const String PhoneNumberValueKey = 'phoneNumber';
const String TransactionMethodValueKey = 'transactionMethod';
const String BankValueKey = 'bank';
const String AcountNumberValueKey = 'acountNumber';
const String AccountNameValueKey = 'accountName';
const String IdTypeValueKey = 'idType';
const String FileUploadValueKey = 'fileUpload';

final Map<String, TextEditingController>
    _RegisterCooperativeViewTextEditingControllers = {};

final Map<String, FocusNode> _RegisterCooperativeViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _RegisterCooperativeViewTextValidations = {
  CooperativeIdValueKey: null,
  CooperativeNameValueKey: null,
  BusinessRegNumberValueKey: null,
  BusinessAddressValueKey: null,
  EmailAdressValueKey: null,
  PhoneNumberValueKey: null,
  TransactionMethodValueKey: null,
  BankValueKey: null,
  AcountNumberValueKey: null,
  AccountNameValueKey: null,
  IdTypeValueKey: null,
  FileUploadValueKey: null,
};

mixin $RegisterCooperativeView {
  TextEditingController get cooperativeIdController =>
      _getFormTextEditingController(CooperativeIdValueKey);
  TextEditingController get cooperativeNameController =>
      _getFormTextEditingController(CooperativeNameValueKey);
  TextEditingController get businessRegNumberController =>
      _getFormTextEditingController(BusinessRegNumberValueKey);
  TextEditingController get businessAddressController =>
      _getFormTextEditingController(BusinessAddressValueKey);
  TextEditingController get emailAdressController =>
      _getFormTextEditingController(EmailAdressValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get transactionMethodController =>
      _getFormTextEditingController(TransactionMethodValueKey);
  TextEditingController get bankController =>
      _getFormTextEditingController(BankValueKey);
  TextEditingController get acountNumberController =>
      _getFormTextEditingController(AcountNumberValueKey);
  TextEditingController get accountNameController =>
      _getFormTextEditingController(AccountNameValueKey);
  TextEditingController get idTypeController =>
      _getFormTextEditingController(IdTypeValueKey);
  TextEditingController get fileUploadController =>
      _getFormTextEditingController(FileUploadValueKey);

  FocusNode get cooperativeIdFocusNode =>
      _getFormFocusNode(CooperativeIdValueKey);
  FocusNode get cooperativeNameFocusNode =>
      _getFormFocusNode(CooperativeNameValueKey);
  FocusNode get businessRegNumberFocusNode =>
      _getFormFocusNode(BusinessRegNumberValueKey);
  FocusNode get businessAddressFocusNode =>
      _getFormFocusNode(BusinessAddressValueKey);
  FocusNode get emailAdressFocusNode => _getFormFocusNode(EmailAdressValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get transactionMethodFocusNode =>
      _getFormFocusNode(TransactionMethodValueKey);
  FocusNode get bankFocusNode => _getFormFocusNode(BankValueKey);
  FocusNode get acountNumberFocusNode =>
      _getFormFocusNode(AcountNumberValueKey);
  FocusNode get accountNameFocusNode => _getFormFocusNode(AccountNameValueKey);
  FocusNode get idTypeFocusNode => _getFormFocusNode(IdTypeValueKey);
  FocusNode get fileUploadFocusNode => _getFormFocusNode(FileUploadValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_RegisterCooperativeViewTextEditingControllers.containsKey(key)) {
      return _RegisterCooperativeViewTextEditingControllers[key]!;
    }

    _RegisterCooperativeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _RegisterCooperativeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_RegisterCooperativeViewFocusNodes.containsKey(key)) {
      return _RegisterCooperativeViewFocusNodes[key]!;
    }
    _RegisterCooperativeViewFocusNodes[key] = FocusNode();
    return _RegisterCooperativeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    cooperativeIdController.addListener(() => _updateFormData(model));
    cooperativeNameController.addListener(() => _updateFormData(model));
    businessRegNumberController.addListener(() => _updateFormData(model));
    businessAddressController.addListener(() => _updateFormData(model));
    emailAdressController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    transactionMethodController.addListener(() => _updateFormData(model));
    bankController.addListener(() => _updateFormData(model));
    acountNumberController.addListener(() => _updateFormData(model));
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
    cooperativeNameController.addListener(() => _updateFormData(model));
    businessRegNumberController.addListener(() => _updateFormData(model));
    businessAddressController.addListener(() => _updateFormData(model));
    emailAdressController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    transactionMethodController.addListener(() => _updateFormData(model));
    bankController.addListener(() => _updateFormData(model));
    acountNumberController.addListener(() => _updateFormData(model));
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
          CooperativeNameValueKey: cooperativeNameController.text,
          BusinessRegNumberValueKey: businessRegNumberController.text,
          BusinessAddressValueKey: businessAddressController.text,
          EmailAdressValueKey: emailAdressController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          TransactionMethodValueKey: transactionMethodController.text,
          BankValueKey: bankController.text,
          AcountNumberValueKey: acountNumberController.text,
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

    for (var controller
        in _RegisterCooperativeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _RegisterCooperativeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _RegisterCooperativeViewTextEditingControllers.clear();
    _RegisterCooperativeViewFocusNodes.clear();
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
  String? get cooperativeNameValue =>
      this.formValueMap[CooperativeNameValueKey] as String?;
  String? get businessRegNumberValue =>
      this.formValueMap[BusinessRegNumberValueKey] as String?;
  String? get businessAddressValue =>
      this.formValueMap[BusinessAddressValueKey] as String?;
  String? get emailAdressValue =>
      this.formValueMap[EmailAdressValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get transactionMethodValue =>
      this.formValueMap[TransactionMethodValueKey] as String?;
  String? get bankValue => this.formValueMap[BankValueKey] as String?;
  String? get acountNumberValue =>
      this.formValueMap[AcountNumberValueKey] as String?;
  String? get accountNameValue =>
      this.formValueMap[AccountNameValueKey] as String?;
  String? get idTypeValue => this.formValueMap[IdTypeValueKey] as String?;
  String? get fileUploadValue =>
      this.formValueMap[FileUploadValueKey] as String?;

  set cooperativeIdValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CooperativeIdValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        CooperativeIdValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[CooperativeIdValueKey]
          ?.text = value ?? '';
    }
  }

  set cooperativeNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CooperativeNameValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        CooperativeNameValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[CooperativeNameValueKey]
          ?.text = value ?? '';
    }
  }

  set businessRegNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BusinessRegNumberValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        BusinessRegNumberValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[BusinessRegNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set businessAddressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BusinessAddressValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        BusinessAddressValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[BusinessAddressValueKey]
          ?.text = value ?? '';
    }
  }

  set emailAdressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailAdressValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        EmailAdressValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[EmailAdressValueKey]
          ?.text = value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[PhoneNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set transactionMethodValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TransactionMethodValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        TransactionMethodValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[TransactionMethodValueKey]
          ?.text = value ?? '';
    }
  }

  set bankValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BankValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        BankValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[BankValueKey]?.text =
          value ?? '';
    }
  }

  set acountNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AcountNumberValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        AcountNumberValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[AcountNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set accountNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AccountNameValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        AccountNameValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[AccountNameValueKey]
          ?.text = value ?? '';
    }
  }

  set idTypeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IdTypeValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        IdTypeValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[IdTypeValueKey]?.text =
          value ?? '';
    }
  }

  set fileUploadValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FileUploadValueKey: value}),
    );

    if (_RegisterCooperativeViewTextEditingControllers.containsKey(
        FileUploadValueKey)) {
      _RegisterCooperativeViewTextEditingControllers[FileUploadValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasCooperativeId =>
      this.formValueMap.containsKey(CooperativeIdValueKey) &&
      (cooperativeIdValue?.isNotEmpty ?? false);
  bool get hasCooperativeName =>
      this.formValueMap.containsKey(CooperativeNameValueKey) &&
      (cooperativeNameValue?.isNotEmpty ?? false);
  bool get hasBusinessRegNumber =>
      this.formValueMap.containsKey(BusinessRegNumberValueKey) &&
      (businessRegNumberValue?.isNotEmpty ?? false);
  bool get hasBusinessAddress =>
      this.formValueMap.containsKey(BusinessAddressValueKey) &&
      (businessAddressValue?.isNotEmpty ?? false);
  bool get hasEmailAdress =>
      this.formValueMap.containsKey(EmailAdressValueKey) &&
      (emailAdressValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasTransactionMethod =>
      this.formValueMap.containsKey(TransactionMethodValueKey) &&
      (transactionMethodValue?.isNotEmpty ?? false);
  bool get hasBank =>
      this.formValueMap.containsKey(BankValueKey) &&
      (bankValue?.isNotEmpty ?? false);
  bool get hasAcountNumber =>
      this.formValueMap.containsKey(AcountNumberValueKey) &&
      (acountNumberValue?.isNotEmpty ?? false);
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
  bool get hasCooperativeNameValidationMessage =>
      this.fieldsValidationMessages[CooperativeNameValueKey]?.isNotEmpty ??
      false;
  bool get hasBusinessRegNumberValidationMessage =>
      this.fieldsValidationMessages[BusinessRegNumberValueKey]?.isNotEmpty ??
      false;
  bool get hasBusinessAddressValidationMessage =>
      this.fieldsValidationMessages[BusinessAddressValueKey]?.isNotEmpty ??
      false;
  bool get hasEmailAdressValidationMessage =>
      this.fieldsValidationMessages[EmailAdressValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasTransactionMethodValidationMessage =>
      this.fieldsValidationMessages[TransactionMethodValueKey]?.isNotEmpty ??
      false;
  bool get hasBankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey]?.isNotEmpty ?? false;
  bool get hasAcountNumberValidationMessage =>
      this.fieldsValidationMessages[AcountNumberValueKey]?.isNotEmpty ?? false;
  bool get hasAccountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey]?.isNotEmpty ?? false;
  bool get hasIdTypeValidationMessage =>
      this.fieldsValidationMessages[IdTypeValueKey]?.isNotEmpty ?? false;
  bool get hasFileUploadValidationMessage =>
      this.fieldsValidationMessages[FileUploadValueKey]?.isNotEmpty ?? false;

  String? get cooperativeIdValidationMessage =>
      this.fieldsValidationMessages[CooperativeIdValueKey];
  String? get cooperativeNameValidationMessage =>
      this.fieldsValidationMessages[CooperativeNameValueKey];
  String? get businessRegNumberValidationMessage =>
      this.fieldsValidationMessages[BusinessRegNumberValueKey];
  String? get businessAddressValidationMessage =>
      this.fieldsValidationMessages[BusinessAddressValueKey];
  String? get emailAdressValidationMessage =>
      this.fieldsValidationMessages[EmailAdressValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get transactionMethodValidationMessage =>
      this.fieldsValidationMessages[TransactionMethodValueKey];
  String? get bankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey];
  String? get acountNumberValidationMessage =>
      this.fieldsValidationMessages[AcountNumberValueKey];
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
  setCooperativeNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CooperativeNameValueKey] =
          validationMessage;
  setBusinessRegNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BusinessRegNumberValueKey] =
          validationMessage;
  setBusinessAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BusinessAddressValueKey] =
          validationMessage;
  setEmailAdressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailAdressValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setTransactionMethodValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TransactionMethodValueKey] =
          validationMessage;
  setBankValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BankValueKey] = validationMessage;
  setAcountNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AcountNumberValueKey] = validationMessage;
  setAccountNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNameValueKey] = validationMessage;
  setIdTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IdTypeValueKey] = validationMessage;
  setFileUploadValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FileUploadValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    cooperativeIdValue = '';
    cooperativeNameValue = '';
    businessRegNumberValue = '';
    businessAddressValue = '';
    emailAdressValue = '';
    phoneNumberValue = '';
    transactionMethodValue = '';
    bankValue = '';
    acountNumberValue = '';
    accountNameValue = '';
    idTypeValue = '';
    fileUploadValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CooperativeIdValueKey: getValidationMessage(CooperativeIdValueKey),
      CooperativeNameValueKey: getValidationMessage(CooperativeNameValueKey),
      BusinessRegNumberValueKey:
          getValidationMessage(BusinessRegNumberValueKey),
      BusinessAddressValueKey: getValidationMessage(BusinessAddressValueKey),
      EmailAdressValueKey: getValidationMessage(EmailAdressValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      TransactionMethodValueKey:
          getValidationMessage(TransactionMethodValueKey),
      BankValueKey: getValidationMessage(BankValueKey),
      AcountNumberValueKey: getValidationMessage(AcountNumberValueKey),
      AccountNameValueKey: getValidationMessage(AccountNameValueKey),
      IdTypeValueKey: getValidationMessage(IdTypeValueKey),
      FileUploadValueKey: getValidationMessage(FileUploadValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _RegisterCooperativeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _RegisterCooperativeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CooperativeIdValueKey: getValidationMessage(CooperativeIdValueKey),
      CooperativeNameValueKey: getValidationMessage(CooperativeNameValueKey),
      BusinessRegNumberValueKey:
          getValidationMessage(BusinessRegNumberValueKey),
      BusinessAddressValueKey: getValidationMessage(BusinessAddressValueKey),
      EmailAdressValueKey: getValidationMessage(EmailAdressValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      TransactionMethodValueKey:
          getValidationMessage(TransactionMethodValueKey),
      BankValueKey: getValidationMessage(BankValueKey),
      AcountNumberValueKey: getValidationMessage(AcountNumberValueKey),
      AccountNameValueKey: getValidationMessage(AccountNameValueKey),
      IdTypeValueKey: getValidationMessage(IdTypeValueKey),
      FileUploadValueKey: getValidationMessage(FileUploadValueKey),
    });
