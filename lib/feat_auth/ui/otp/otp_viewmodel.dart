import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/app/app.logger.dart';
import 'package:thrivia_app/app/app.router.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_auth/data_models/verify_o_t_p_request.dart';
import 'package:thrivia_app/feat_auth/services/auth_service.dart';
import 'package:thrivia_app/feat_auth/ui/otp/otp_view.dart';
import 'package:thrivia_app/feat_auth/ui/otp/otp_view.form.dart';

const String requestOTPBusyKey = 'timer-key';

class OtpViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  final logger = getLogger("OtpViewModel");

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
    logger.i("Requesting OTP");
    if (!canRequestOtp) return;

    setError(null);

    await runErrorFuture(_authService.requestOTP());
    // setError(error(requestOTPBusyKey));

    startTimer();
  }

  Future<void> verifyOtp() async {
    if (otpValue?.length != 5) {
      setErrorForModelOrObject('Please enter all digits');
      notifyListeners();
      return;
    }

    setError(null);

    final result = await runBusyFuture(_authService.verifyOTP(otpValue!));

    if (_authService.authState == AuthState.pendingPasswordResetOTP) {
      _navigationService.back(result: true);
    }
    _navigationService.replaceWithBottomNavView();

    // setError();
  }
}
