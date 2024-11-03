import 'package:bloc/bloc.dart';
import 'package:challenge/features/payment/data/models/payment_intent_input.dart';
import 'package:challenge/features/payment/logic/payment_state.dart';
import 'package:challenge/features/payment/data/repo/checkout_repo.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;
  PaymentCubit(this.checkoutRepo) : super(const PaymentState.initial());

  Future<bool> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
  emit(const PaymentState.paymentLoading());

  var data = await checkoutRepo.makePayment(
    paymentIntentInputModel: paymentIntentInputModel,
  );

  return data.fold(
    (l) {
      emit(PaymentState.paymentError(errorMessage: l.errMessage));
      print('paymentError: ${l.errMessage}');
      return false; // فشل الدفع
    },
    (r) {
      print('paymentSuccess: ${data.toString()}');
      emit(const PaymentState.paymentSuccess());
      return true; // نجاح الدفع
    },
  );
}

}