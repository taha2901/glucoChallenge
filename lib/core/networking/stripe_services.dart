// import 'package:challenge/core/networking/api_keys.dart';
// import 'package:challenge/core/networking/api_serveices_for_payment.dart';
// import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
// import 'package:challenge/features/payment/data/models/payment_intent_response/payment_intent_response.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeServices {
//   final ApiServeicesForPayment apiServeices = ApiServeicesForPayment();

//   Future<PaymentIntentModel> createPaymentIntent(
//       PaymentIntentInputModel paymentIntentResponse) async {
//     final response = await apiServeices.POST(
//       url: 'https://api.stripe.com/v1/payment_intents',
//       body: paymentIntentResponse.toJson(),
//       token: ApiKeys.secretKey,
//       headers: {
//         'Authorization': 'Bearer ${ApiKeys.secretKey}',
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//     );

//     var paymentIntentRequestModel = PaymentIntentModel.fromJson(response.data);
//     return paymentIntentRequestModel;
//   }

//   Future initPaymentSheet({required String paymentIntentClientSecret}) async {
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntentClientSecret,
//         merchantDisplayName: "Taha",
//       ),
//     );
//   }

//   Future displayPaymentSheet() async {
//     await Stripe.instance.presentPaymentSheet();
//   }

//   Future makePayment(
//       {required PaymentIntentInputModel paymentIntentInputModel}) async {
//     var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

//     await initPaymentSheet(
//         paymentIntentClientSecret: paymentIntentModel.clientSecret!);
//     await displayPaymentSheet();
//   }
// }

import 'package:challenge/core/networking/api_keys.dart';
import 'package:challenge/core/networking/api_serveices_for_payment.dart';
import 'package:challenge/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:challenge/features/payment/data/models/init_payment_sheet_input.dart';
import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
import 'package:challenge/features/payment/data/models/payment_intent_response/payment_intent_response.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final ApiServeicesForPayment apiServeices = ApiServeicesForPayment();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final response = await apiServeices.POST(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initiPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
        merchantDisplayName: 'tharwat',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        paymentIntentInputModel.customerId); // هنا احصل على المفتاح

    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );

    await initPaymentSheet(
        initiPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    var response = await apiServeices.POST(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2024-06-20',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
