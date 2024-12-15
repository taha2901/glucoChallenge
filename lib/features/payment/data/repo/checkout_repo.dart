import 'package:challenge/core/networking/error_payment.dart';
import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}


