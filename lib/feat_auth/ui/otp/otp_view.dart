import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:thrivia_app/common/form_validators.dart';
import 'package:thrivia_app/ui/widgets/model_error_display.dart';

import 'otp_view.form.dart';
import 'otp_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: "d1", validator: FormValidators.otpFieldValidator),
    FormTextField(name: "d2", validator: FormValidators.otpFieldValidator),
    FormTextField(name: "d3", validator: FormValidators.otpFieldValidator),
    FormTextField(name: "d4", validator: FormValidators.otpFieldValidator),
    FormTextField(name: "d5", validator: FormValidators.otpFieldValidator),
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
    final controllers = [
      d1Controller,
      d2Controller,
      d3Controller,
      d4Controller,
      d5Controller,
      // d6Controller,
    ];
    final focusNodes = [
      d1FocusNode,
      d2FocusNode,
      d3FocusNode,
      d4FocusNode,
      d5FocusNode,
      // d6FocusNode,
    ];
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  controllers.length,
                  (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      focusNode: focusNodes[index],
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (value) {
                        if (controllers[index].text.isNotEmpty) {
                          // FocusScope.of(context).onKeyEvent
                          //   viewModel.backspace(index);
                          // } else {
                          viewModel.forward(index);
                        }
                      },
                      style: TextStyle(
                          // color: Theme.of(context).colorScheme.primary,
                          ),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.digitsOnly,
                      // ],

                      // on: (RawKeyEvent event) {
                      //   if (event.logicalKey ==
                      //       LogicalKeyboardKey.backspace) {
                      //     if (event is RawKeyDownEvent) {
                      //       viewModel.backspace(index);
                      //     }
                      //   }
                      // },
                    ),
                  ),
                ),
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
    viewModel.otpView = this;
  }

  @override
  OtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpViewModel();
}
