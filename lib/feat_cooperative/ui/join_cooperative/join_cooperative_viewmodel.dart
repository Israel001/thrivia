import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.bottomsheets.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/common/ui_helpers.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.dart';
import 'package:thrivia_app/feat_cooperative/ui/join_cooperative/join_cooperative_view.form.dart';
import 'package:thrivia_app/ui/widgets/primary_button.dart';

class JoinCooperativeViewModel extends FormViewModel {
  PageController pageController = PageController();
  final bottomSheetService = locator<BottomSheetService>();
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
    final pageValid = switch (pageNumber) {
      0 => allNull([
          cooperativeIdValidationMessage,
          membershipNumberValidationMessage,
        ]),
      1 => allNull([
          fullNameValidationMessage,
          dateOfBirthValidationMessage,
          phoneNumberValidationMessage,
          emailAddressValidationMessage,
          residentialAddressValidationMessage,
        ]),
      2 => allNull([
          paymentMethodValidationMessage,
          bankValidationMessage,
          accountNumberValidationMessage,
          accountNameValidationMessage,
        ]),
      3 => allNull([
            idTypeValidationMessage,
            fileUploadValidationMessage,
          ]) &&
          _termsAccepted,
      _ => false
    };

    return pageValid;
  }

  bool allNull(List<String?> validationMessages) {
    for (final message in validationMessages) {
      if (message == null) {
        continue;
      } else {
        return false;
      }
    }

    return true;
  }

  void selectDateOfBirth(BuildContext topContext) async {
    var dateTime = DateTime.now();
    final dateOfBirth = await showDatePicker(
      context: topContext,
      initialDate: dateTime,
      initialEntryMode: DatePickerEntryMode.calendar,
      firstDate: DateTime(dateTime.year - 100),
      lastDate: dateTime,
      builder: (context, child) {
        return Theme(
            data: ThemeData.from(
              colorScheme: ColorScheme.light(
                  primary: Theme.of(topContext).colorScheme.onPrimary),
              // primaryColor: Theme.of(context).colorScheme.primary,
            ),
            child: child!);
        // return child!;
      },
    );

    if (dateOfBirth != null) {
      dateOfBirthValue = dateOfBirth.format;
    }
  }

  fileUpload() {}
  final bottomsheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  void toggleTerms(bool? value) {
    _termsAccepted = value ?? !termsAccepted;
    rebuildUi();
  }

  void cancel() {
    _navigationService.back();
  }

  bool get termsAccepted => _termsAccepted;
  bool _termsAccepted = false;
}

extension Format on DateTime {
  String get format => "$year-$month-$day";
}
