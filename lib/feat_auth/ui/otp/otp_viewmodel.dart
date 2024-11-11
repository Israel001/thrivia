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

  late OtpView _OTPView;
  late List<FocusNode> focusNodes;
  late List<TextEditingController> textControllers;
  set otpView(OtpView otpView) {
    _OTPView = otpView;

// var    onKeyEvent = (index, element) {
//       if (index == 0) {
//         return element;
//       }
//       element.onKeyEvent = (node, event) {
//         if (event.logicalKey == LogicalKeyboardKey.backspace &&
//             event is KeyUpEvent) {
//           // FocusScope.of(context).previousFocus();
//           node.previousFocus();
//         }
//         return KeyEventResult.ignored;
//       };
//       return element;
//     };
    focusNodes = [
      _OTPView.d1FocusNode,
      _OTPView.d2FocusNode,
      _OTPView.d3FocusNode,
      _OTPView.d4FocusNode,
      _OTPView.d5FocusNode,
    ];
    //.indexed.map((e) {
    //   final (index, node) = e;

    //   if (index == 0) {
    //     return node;
    //   }
    //   node.onKeyEvent = (node, event) {
    //     if (event.logicalKey == LogicalKeyboardKey.backspace &&
    //         textControllers[index].text.isEmpty &&
    //         event is KeyUpEvent) {
    //       // FocusScope.of(context).previousFocus();
    //       // node.previousFocus();
    //       backspace(index);
    //     }
    //     return KeyEventResult.ignored;
    //   };
    //   return node;
    // }).toList();

    textControllers = [
      _OTPView.d1Controller,
      _OTPView.d2Controller,
      _OTPView.d3Controller,
      _OTPView.d4Controller,
      _OTPView.d5Controller,
    ];
  }

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

    clearForm();
    startTimer();
  }

  void forward(int index) {
    if (textControllers[index].text.isNotEmpty && index < 4) {
      focusNodes[index + 1].requestFocus();
    }

    // if (formValueMap.values.every((digit) => digit.isNotEmpty)) {
    //   verifyOtp();
    // }
  }

  void backspace(
    int index,
  ) {
    if (index > 0 && textControllers[index].text.isEmpty) {
      focusNodes[index - 1].requestFocus();
      // textControllers[index].text = '';
      textControllers[index - 1].text = '';
    } else {}
    // notifyListeners();
  }

  Future<void> verifyOtp() async {
    final otp = formValueMap.values
        .fold("", (previousValue, element) => previousValue + element);
    if (otp.length != 5) {
      setValidationMessage('Please enter all digits');
      notifyListeners();
      return;
    }

    setError(null);

    final result = await runBusyFuture(_authService.verifyOTP(otp));

    if (_authService.authState == AuthState.pendingPasswordResetOTP) {
      _navigationService.back(result: true);
    }
    _navigationService.replaceWithBottomNavView();

    // setError();
  }
}
