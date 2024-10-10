// import 'package:challenge/core/networking/api_serveices_for_payment.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeServices {
//   final ApiServeices apiServeices = ApiServeices();

//   Future<PaymentIntentResponse> createPaymentIntent(
//       PaymentIntentInput paymentIntentResponse) async {
//     var response = await apiServeices.POST(
//       url: 'https://api.stripe.com/v1/payment_intents',
//       body: paymentIntentResponse.toJson(),
//       token: ApiKeys.secretKey,
//       contentType: Headers.formUrlEncodedContentType,
      
//     );
//     var paymentIntentRequestModel =
//         PaymentIntentResponse.fromJson(response.data);
//     return paymentIntentRequestModel;
//   }

//   Future initPaymentSheet({required String paymentIntentClientSheet}) async {
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntentClientSheet,
//         merchantDisplayName: "Taha",
//       ),
//     );
//   }

//   Future displayPaymentSheet() async {
//     await Stripe.instance.presentPaymentSheet();
//   }

//   Future makePayment(
//       {required PaymentIntentInput paymentIntentInputModel}) async {
//     var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

//     await initPaymentSheet(
//         paymentIntentClientSheet: paymentIntentModel.clientSecret!);
//     await displayPaymentSheet();
//   }


//   // Future<PaymentIntentResponse> createCustomer(
//   //     PaymentIntentInput paymentIntentResponse) async {
//   //   var response = await apiServeices.POST(
//   //     url: 'https://api.stripe.com/v1/payment_intents',
//   //     body: paymentIntentResponse.toJson(),
//   //     token: ApiKeys.secretkey,
//   //     contentType: Headers.formUrlEncodedContentType,
//   //   );
//   //   var paymentIntentRequestModel =
//   //       PaymentIntentResponse.fromJson(response.data);
//   //   return paymentIntentRequestModel;
//   // }
// }
