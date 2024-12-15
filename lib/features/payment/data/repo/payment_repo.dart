import 'package:challenge/core/networking/api_error_handler.dart';
import 'package:challenge/core/networking/api_result.dart';
import 'package:challenge/core/networking/stripe_services.dart';
import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
import 'package:challenge/features/payment/data/models/payment_intent_response/payment_intent_response.dart';
import 'package:flutter/material.dart';

class PaymentRepo {
  final StripeServices _stripeServices;
  PaymentRepo(this._stripeServices);

  Future<ApiResult<PaymentIntentModel>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      final response = await _stripeServices.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      debugPrint('API Payment Response: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('API Payment Error in repo: $error');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
