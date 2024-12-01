import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.bottomsheets.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/feat_cooperative/ui/register_cooperative/register_cooperative/register_cooperative_view.form.dart';

class RegisterCooperativeViewModel extends FormViewModel {
  PageController pageController = PageController();
  final bottomSheetService = locator<BottomSheetService>();

  get termsAccepted => null;
  void proceed() {
    int currentPage = pageController.page!.toInt();
    final pageIsValid = validatePage(currentPage);
    // if (!pageIsValid) {
    //   return;
    // }
    if (currentPage == 3) {
      bottomSheetService.showCustomSheet(variant: BottomSheetType.notice);
    }
    pageController.animateToPage(currentPage + 1,
        duration: Durations.long1, curve: Curves.easeIn);
  }

  bool validatePage(int pageNumber) {
    validateForm();
    return false;
    // final pageValid = switch (pageNumber) {
    //   0 => allNull([
    //       cooperativeIdValidationMessage,
    //       membershipNumberValidationMessage,
    //     ]),
    //   1 => allNull([
    //       fullNameValidationMessage,
    //       dateOfBirthValidationMessage,
    //       phoneNumberValidationMessage,
    //       emailAddressValidationMessage,
    //       residentialAddressValidationMessage,
    //     ]),
    //   2 => allNull([
    //       paymentMethodValidationMessage,
    //       bankValidationMessage,
    //       accountNumberValidationMessage,
    //       accountNameValidationMessage,
    //     ]),
    //   3 => allNull([
    //         idTypeValidationMessage,
    //         fileUploadValidationMessage,
    //       ]) &&
    //       _termsAccepted,
    //   _ => false
    // };

    // return pageValid;
  }

  fileUpload() {}

  void toggleTerms(bool? value) {}

  void cancel() {}
}
