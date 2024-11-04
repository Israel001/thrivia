// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thrivia_app/common/form_validators.dart';

const bool _autoTextFieldValidation = true;

const String D1ValueKey = 'd1';
const String D2ValueKey = 'd2';
const String D3ValueKey = 'd3';
const String D4ValueKey = 'd4';
const String D5ValueKey = 'd5';

final Map<String, TextEditingController> _OtpViewTextEditingControllers = {};

final Map<String, FocusNode> _OtpViewFocusNodes = {};

final Map<String, String? Function(String?)?> _OtpViewTextValidations = {
  D1ValueKey: FormValidators.otpFieldValidator,
  D2ValueKey: FormValidators.otpFieldValidator,
  D3ValueKey: FormValidators.otpFieldValidator,
  D4ValueKey: FormValidators.otpFieldValidator,
  D5ValueKey: FormValidators.otpFieldValidator,
};

mixin $OtpView {
  TextEditingController get d1Controller =>
      _getFormTextEditingController(D1ValueKey);
  TextEditingController get d2Controller =>
      _getFormTextEditingController(D2ValueKey);
  TextEditingController get d3Controller =>
      _getFormTextEditingController(D3ValueKey);
  TextEditingController get d4Controller =>
      _getFormTextEditingController(D4ValueKey);
  TextEditingController get d5Controller =>
      _getFormTextEditingController(D5ValueKey);

  FocusNode get d1FocusNode => _getFormFocusNode(D1ValueKey);
  FocusNode get d2FocusNode => _getFormFocusNode(D2ValueKey);
  FocusNode get d3FocusNode => _getFormFocusNode(D3ValueKey);
  FocusNode get d4FocusNode => _getFormFocusNode(D4ValueKey);
  FocusNode get d5FocusNode => _getFormFocusNode(D5ValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_OtpViewTextEditingControllers.containsKey(key)) {
      return _OtpViewTextEditingControllers[key]!;
    }

    _OtpViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _OtpViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_OtpViewFocusNodes.containsKey(key)) {
      return _OtpViewFocusNodes[key]!;
    }
    _OtpViewFocusNodes[key] = FocusNode();
    return _OtpViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    d1Controller.addListener(() => _updateFormData(model));
    d2Controller.addListener(() => _updateFormData(model));
    d3Controller.addListener(() => _updateFormData(model));
    d4Controller.addListener(() => _updateFormData(model));
    d5Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    d1Controller.addListener(() => _updateFormData(model));
    d2Controller.addListener(() => _updateFormData(model));
    d3Controller.addListener(() => _updateFormData(model));
    d4Controller.addListener(() => _updateFormData(model));
    d5Controller.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          D1ValueKey: d1Controller.text,
          D2ValueKey: d2Controller.text,
          D3ValueKey: d3Controller.text,
          D4ValueKey: d4Controller.text,
          D5ValueKey: d5Controller.text,
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

    for (var controller in _OtpViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _OtpViewFocusNodes.values) {
      focusNode.dispose();
    }

    _OtpViewTextEditingControllers.clear();
    _OtpViewFocusNodes.clear();
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

  String? get d1Value => this.formValueMap[D1ValueKey] as String?;
  String? get d2Value => this.formValueMap[D2ValueKey] as String?;
  String? get d3Value => this.formValueMap[D3ValueKey] as String?;
  String? get d4Value => this.formValueMap[D4ValueKey] as String?;
  String? get d5Value => this.formValueMap[D5ValueKey] as String?;

  set d1Value(String? value) {
    this.setData(
      this.formValueMap..addAll({D1ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(D1ValueKey)) {
      _OtpViewTextEditingControllers[D1ValueKey]?.text = value ?? '';
    }
  }

  set d2Value(String? value) {
    this.setData(
      this.formValueMap..addAll({D2ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(D2ValueKey)) {
      _OtpViewTextEditingControllers[D2ValueKey]?.text = value ?? '';
    }
  }

  set d3Value(String? value) {
    this.setData(
      this.formValueMap..addAll({D3ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(D3ValueKey)) {
      _OtpViewTextEditingControllers[D3ValueKey]?.text = value ?? '';
    }
  }

  set d4Value(String? value) {
    this.setData(
      this.formValueMap..addAll({D4ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(D4ValueKey)) {
      _OtpViewTextEditingControllers[D4ValueKey]?.text = value ?? '';
    }
  }

  set d5Value(String? value) {
    this.setData(
      this.formValueMap..addAll({D5ValueKey: value}),
    );

    if (_OtpViewTextEditingControllers.containsKey(D5ValueKey)) {
      _OtpViewTextEditingControllers[D5ValueKey]?.text = value ?? '';
    }
  }

  bool get hasD1 =>
      this.formValueMap.containsKey(D1ValueKey) &&
      (d1Value?.isNotEmpty ?? false);
  bool get hasD2 =>
      this.formValueMap.containsKey(D2ValueKey) &&
      (d2Value?.isNotEmpty ?? false);
  bool get hasD3 =>
      this.formValueMap.containsKey(D3ValueKey) &&
      (d3Value?.isNotEmpty ?? false);
  bool get hasD4 =>
      this.formValueMap.containsKey(D4ValueKey) &&
      (d4Value?.isNotEmpty ?? false);
  bool get hasD5 =>
      this.formValueMap.containsKey(D5ValueKey) &&
      (d5Value?.isNotEmpty ?? false);

  bool get hasD1ValidationMessage =>
      this.fieldsValidationMessages[D1ValueKey]?.isNotEmpty ?? false;
  bool get hasD2ValidationMessage =>
      this.fieldsValidationMessages[D2ValueKey]?.isNotEmpty ?? false;
  bool get hasD3ValidationMessage =>
      this.fieldsValidationMessages[D3ValueKey]?.isNotEmpty ?? false;
  bool get hasD4ValidationMessage =>
      this.fieldsValidationMessages[D4ValueKey]?.isNotEmpty ?? false;
  bool get hasD5ValidationMessage =>
      this.fieldsValidationMessages[D5ValueKey]?.isNotEmpty ?? false;

  String? get d1ValidationMessage => this.fieldsValidationMessages[D1ValueKey];
  String? get d2ValidationMessage => this.fieldsValidationMessages[D2ValueKey];
  String? get d3ValidationMessage => this.fieldsValidationMessages[D3ValueKey];
  String? get d4ValidationMessage => this.fieldsValidationMessages[D4ValueKey];
  String? get d5ValidationMessage => this.fieldsValidationMessages[D5ValueKey];
}

extension Methods on FormStateHelper {
  setD1ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[D1ValueKey] = validationMessage;
  setD2ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[D2ValueKey] = validationMessage;
  setD3ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[D3ValueKey] = validationMessage;
  setD4ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[D4ValueKey] = validationMessage;
  setD5ValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[D5ValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    d1Value = '';
    d2Value = '';
    d3Value = '';
    d4Value = '';
    d5Value = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      D1ValueKey: getValidationMessage(D1ValueKey),
      D2ValueKey: getValidationMessage(D2ValueKey),
      D3ValueKey: getValidationMessage(D3ValueKey),
      D4ValueKey: getValidationMessage(D4ValueKey),
      D5ValueKey: getValidationMessage(D5ValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _OtpViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _OtpViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      D1ValueKey: getValidationMessage(D1ValueKey),
      D2ValueKey: getValidationMessage(D2ValueKey),
      D3ValueKey: getValidationMessage(D3ValueKey),
      D4ValueKey: getValidationMessage(D4ValueKey),
      D5ValueKey: getValidationMessage(D5ValueKey),
    });
