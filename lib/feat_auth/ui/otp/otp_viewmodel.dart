import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/data_models/verify_o_t_p_request.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';

class OtpViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  static String? validator(String? value) {
    return null;
  }

  String? errorMessage;

  // Timer related variables
  Timer? _timer;
  int _timeLeft = 0;
  String get timeLeftString => _timeLeft > 0
      ? '${(_timeLeft ~/ 60).toString().padLeft(2, '0')}:${(_timeLeft % 60).toString().padLeft(2, '0')}'
      : '';
  bool get canRequestOtp => _timeLeft == 0 && !isBusy;

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    _timeLeft = 120; // 2 minutes
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  String get requestText =>
      canRequestOtp ? 'Send new code' : 'Send new code (${timeLeftString})';

  Future<void> requestOtp() async {
    if (!canRequestOtp) return;

    try {
      // setBusy(true);
      errorMessage = null;
      notifyListeners();

      // Simulate API call
      // await Future.delayed(const Duration(seconds: 1));
      _authService.sendOTP();

      // TODO: Replace with actual OTP request API call

      // Clear current OTP if any

      // Start the timer
      startTimer();

      // Focus first input
    } catch (e) {
      errorMessage = 'Failed to request OTP. Please try again.';
    } finally {
      // setBusy(true);
      notifyListeners();
    }
  }

  // void updateDigit(int index, String value) {
  //   if (value.length > 1) {
  //     value = value.substring(value.length - 1);
  //   }

  //   otpDigits[index] = value;
  //   notifyListeners();

  //   if (value.isNotEmpty && index < 5) {
  //     focusNodes[index + 1].requestFocus();
  //   }

  //   if (otpDigits.every((digit) => digit.isNotEmpty)) {
  //     verifyOtp();
  //   }
  // }

  // void backspace(int index) {
  //   if (otpDigits[index].isEmpty && index > 0) {
  //     focusNodes[index - 1].requestFocus();
  //     otpDigits[index - 1] = '';
  //   } else {
  //     otpDigits[index] = '';
  //   }
  //   notifyListeners();
  // }

  Future<void> verifyOtp() async {
    final otp = formValueMap.values
        .fold("", (previousValue, element) => previousValue + element);
    if (otp.length != 6) {
      errorMessage = 'Please enter all digits';
      notifyListeners();
      return;
    }

    try {
      setBusy(true);
      errorMessage = null;
      notifyListeners();

      final otpVerified = await _authService.verifyOTP(otp);

      if (otpVerified) {
        // Example validation
        // Navigate to next screen or handle success
        print('OTP Verified Successfully');
        _navigationService.navigateTo(Routes.homeView);
      } else {
        setValidationMessage('Invalid OTP. Please try again.');
      }
    } catch (e) {
      setValidationMessage('Something went wrong. Please try again.');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void resendOtp() {
    requestOtp(); // Reuse the request OTP logic
  }
}
