import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autodetect/sms_autodetect.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/ui/widgets/model_error_display.dart';

import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

@FormView(
  autoTextFieldValidation: false,
  fields: [
    FormTextField(
      name: "otp",
    ),
  ],
)
class OtpView extends StackedView<OtpViewModel> with $OtpView {
  final bool timerStarted;
  const OtpView({Key? key, this.timerStarted = false}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'OTP Verification',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 8),

              // const SizedBox(height: 24),

              // const SizedBox(height: ),

              const Text(
                'Enter Verification Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: List.generate(
              //     viewModel.textControllers.length,
              //     (index) => SizedBox(
              //       width: 50,
              //       child: Focus(
              //         // focusNode: viewModel.parentFocusNode,
              //         onKeyEvent: (node, event) =>
              //             viewModel.onkeyEvent(event, index),
              //         // onKeyEvent: (event) {
              //         //   if (event.logicalKey == LogicalKeyboardKey.backspace &&
              //         //       event is KeyDownEvent) {
              //         //     debugPrint("keyevent");
              //         //     viewModel.backspace(index);
              //         //     // FocusScope.of(context)
              //         //     //     .requestFocus(viewModel.focusNodes[index - 1]);
              //         //   }
              //         //   // viewModel.onkeyEvent(event, index);
              //         // },
              //         child: TextField(
              //           // autofocus: true,

              //           focusNode: viewModel.focusNodes[index],
              //           // autofocus: true,
              //           controller: viewModel.textControllers[index],
              //           textAlign: TextAlign.center,
              //           keyboardType: const TextInputType.numberWithOptions(
              //               decimal: false),
              //           maxLength: 1,
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               // FocusScope.of(context).unfocus();
              //               debugPrint("value: $value; next");

              //               final success = viewModel.forward(index);

              //               // viewModel.forward(index);

              //               // viewModel.backspace(index);
              //             } else {}
              //           },
              //           style: TextStyle(
              //               // color: Theme.of(context).colorScheme.primary,
              //               ),
              //           decoration: InputDecoration(
              //             counterText: '',
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(8),
              //             ),
              //             filled: true,
              //             fillColor: Colors.grey[100],
              //           ),

              //           // inputFormatters: [
              //           //   FilteringTextInputFormatter.digitsOnly,
              //           // ],

              //           // on: (RawKeyEvent event) {
              //           //   if (event.logicalKey ==
              //           //       LogicalKeyboardKey.backspace) {
              //           //     if (event is RawKeyDownEvent) {
              //           //       viewModel.backspace(index);
              //           //     }
              //           //   }
              //           // },
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              PinCodeTextField(
                autoDisposeControllers: false,
                appContext: context,

                // pastedTextStyle: TextStyle(
                //   color: Colors.green.shade600,
                //   fontWeight: FontWeight.bold,
                // ),
                textStyle: TextStyle(

                    // color: Theme.of(context).colorScheme,
                    ),
                length: 5,
                autoFocus: true,
                obscureText: false,
                obscuringCharacter: '*',
                // if you are using obscuringCharacter remove obscuringWidget
                // obscuringWidget: Icon(Icons.vpn_key_rounded),
                blinkWhenObscuring: true,
                animationCurve: Curves.decelerate,
                animationType: AnimationType.scale,
                // validator: (v) {
                //   if (v!.length < 5) {
                //     return "Please enter valid OTP";
                //   } else {
                //     return null;
                //   }
                // },
                pinTheme: PinTheme(
                  fieldOuterPadding: EdgeInsets.only(left: 5, right: 5),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 45,
                  inactiveFillColor: Colors.grey[100],
                  activeFillColor: Colors.grey[100],
                  selectedColor: Colors.black54,
                  selectedFillColor: Colors.grey[100],
                  inactiveColor: Colors.black54,
                  activeColor: Colors.black54,
                ),
                cursorColor: Colors.black,

                enableActiveFill: true,
                autoDismissKeyboard: false,
                controller: otpController,
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.center,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 5,
                  )
                ],
                onCompleted: (v) {
                  print("Completed");
                },
                onTap: () {
                  print("Pressed");
                },
                onChanged: (value) {
                  print(value);
                },
                // beforeTextPaste: (text) {
                //   if (int.tryParse(text) == null) {
                //     return false;
                //   }
                //   print("Allowing to paste $text");
                //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //   return true;
                // },
              ),
              ModelErrorDisplay(viewModel: viewModel),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed:
                      viewModel.canRequestOtp ? viewModel.requestOtp : null,
                  child: Text(
                    viewModel.requestText,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      viewModel.isBusy ? null : () => viewModel.verifyOtp(),
                  child: viewModel.isBusy
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Verify'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(OtpViewModel viewModel) {
    // TODO: implement onDispose
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(OtpViewModel viewModel) {
    super.onViewModelReady(viewModel);
    if (timerStarted) {
      viewModel.startTimer();
    }

    syncFormWithViewModel(viewModel);
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
