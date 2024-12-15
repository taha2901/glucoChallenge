import 'package:challenge/core/networking/error_payment.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/networking/stripe_services.dart';
import '../models/payment_intent_input.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeServices stripeService = StripeServices();
  
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    }  catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
