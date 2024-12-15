import 'dart:io';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/features/register/data/model/register_response_body.dart';
import 'package:challenge/features/register/data/repo/register_repo.dart';
import 'package:challenge/features/register/logic/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RegisterResponseBody? registerResponseBody;

  File? image;
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  void emitSignupStates() async {
  emit(const RegisterState.loading());

  // تجهيز البيانات في FormData
  FormData formData = FormData.fromMap({
    "Username": nameController.text,
    "Email": emailController.text,
    "Phone": phoneController.text,
    "Password": passWordController.text,
    "Address": addressController.text,
    "Photo": await MultipartFile.fromFile(image!.path),
  });

  final response = await _registerRepo.register(formData);
  response.when(success: (signupResponse) async{
    registerResponseBody = signupResponse;
    emit(RegisterState.success(signupResponse));


    await SharedPrefHelper.setData('photoUrl', signupResponse.photoUrl);
    await SharedPrefHelper.setData('name', nameController.text);
    await SharedPrefHelper.setData('password', passWordController.text);
  }, failure: (error) {
    emit(RegisterState.error(error));
  });
}
}
