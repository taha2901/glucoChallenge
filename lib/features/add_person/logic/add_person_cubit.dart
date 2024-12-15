import 'package:challenge/core/helpers/email_services.dart';
import 'package:challenge/core/helpers/local_notify.dart';
import 'package:challenge/features/add_person/data/repo/add_person_repo.dart';
import 'package:challenge/features/add_person/logic/add_person_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  final AddPersonRepo _addPersonRepo;
  final NotificationService _notificationService;
  final EmailService _emailService;

  AddPersonCubit(this._addPersonRepo, this._notificationService, this._emailService)
      : super(const AddPersonState.initial());

  static AddPersonCubit get(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final relationController = TextEditingController();

  void addPerson({
    required String email,
    required String phone,
    required String relation,
  }) async {
    if (isClosed) return;
    emit(const AddPersonState.addPersonLoading());

    final response = await _addPersonRepo.addPerson(
      email,
      phone,
      relation,
    );

    response.when(success: (addPersonResponse) {
      if (isClosed) return;
      emit(AddPersonState.addPersonSuccess(addPerson: addPersonResponse));

      // إرسال إشعار بعد إضافة الشخص بنجاح
      _notificationService.sendPersonAddedNotification(email);
           _emailService.sendEmail(
        email, 
        'Person Added Successfully', 
        'You have successfully added a person with the following details: Email: $email, Phone: $phone, Relation: $relation'
      );
    }, failure: (apiErrorModel) {
      if (isClosed) return;
      emit(AddPersonState.addPersonError(apiErrorModel));
    });
  }
}
