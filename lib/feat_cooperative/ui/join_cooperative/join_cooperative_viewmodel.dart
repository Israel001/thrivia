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
  void proceed() async {
    int currentPage = pageController.page!.toInt();
    final pageIsValid = validatePage(currentPage);

    if (!pageIsValid) {
      return;
    }

    fieldsValidationMessages.clear();
    if (currentPage == 3) {
      confirmSubmitApplication();
      return;
    }
    pageController.animateToPage(currentPage + 1,
        duration: Durations.long1, curve: Curves.easeIn);
  }

  confirmSubmitApplication() async {
    final response = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: "Submit application",
      description:
          '''Kindly ensure that all data was provided correctly before submitting your application.
 You can’t edit an application once it’s submitted''',
      mainButtonTitle: "Submit application",
      secondaryButtonTitle: "Cancel",
    );

    final submitApplication = response?.confirmed ?? false;

    if (submitApplication) {
      //do submit application

      bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: "Application completed!",
        description:
            '''Your application has his forwarded to the directors of Freedom Cooperative for further review.''',
        mainButtonTitle: "Cancel",
      );
    }
  }

  bool validatePage(int pageNumber) {
    switch (pageNumber) {
      case 0:
        setValidationMessages({
          CooperativeIdValueKey: getValidationMessage(CooperativeIdValueKey),
          MembershipNumberValueKey:
              getValidationMessage(MembershipNumberValueKey),
        });
        break;
      case 1:
        setValidationMessages({
          FullNameValueKey: getValidationMessage(FullNameValueKey),
          DateOfBirthValueKey: getValidationMessage(DateOfBirthValueKey),
          PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
          EmailAddressValueKey: getValidationMessage(EmailAddressValueKey),
          ResidentialAddresValueKey:
              getValidationMessage(ResidentialAddresValueKey),
        });
        break;

      case 2:
        setValidationMessages({
          PaymentMethodValueKey: getValidationMessage(PaymentMethodValueKey),
          BankValueKey: getValidationMessage(BankValueKey),
          AccountNumberValueKey: getValidationMessage(AccountNumberValueKey),
          AccountNameValueKey: getValidationMessage(AccountNameValueKey),
          IdTypeValueKey: getValidationMessage(IdTypeValueKey),
          FileUploadValueKey: getValidationMessage(FileUploadValueKey),
        });
        break;
      case 3:
        setValidationMessages({
          IdTypeValueKey: getValidationMessage(IdTypeValueKey),
          FileUploadValueKey: getValidationMessage(FileUploadValueKey),
        });
        termsAcceptedValidationMessage =
            _termsAccepted ? null : "Please accept terms and conditions";
        break;
    }
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
          residentialAddresValidationMessage,
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
    var dateTime = DateTime.tryParse(dateOfBirthValue ?? "") ?? DateTime.now();
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

  String? termsAcceptedValidationMessage;
}

extension Format on DateTime {
  String get format => toIso8601String().split('T').first;

  //  "$year-$month-$day";
}
