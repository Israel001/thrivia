// import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:thrivia_app/app/app.locator.dart';
import 'package:thrivia_app/common/json_parser.dart';
import 'package:thrivia_app/feat_auth/data_models/data_models.barrel.dart';
import 'package:thrivia_app/feat_cooperative/data_models/data_models.dart';

import '../helpers/test_helpers.dart';

void main() {
//   group('AuthRepositoryServiceTest -', () {
//     setUp(() => registerServices());
//     tearDown(() => locator.reset());
//   });

  group('group name', () {
    const jsonMap = {"paymentUuid": ""};
    try {
      parseMultipleTypes([
        VerifyOTPBody.fromJson,
        DepositMoneyRequest.fromJson,
        CreateCooperativeRequest.fromJson
      ], jsonMap);
    } on VerifyOTPBody {
      print("json is verifyotpBody");
    } on DepositMoneyRequest {
      print("json is depositMoneyRequest");
    } catch (e) {
      print("json error: ${e.toString()}");
    }
  });
}
