import 'dart:io';
import 'package:challenge/core/helpers/api_serveices.dart';
import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/features/register/data/model/register_response_body.dart';
import 'package:challenge/features/register/logic/register_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState.initial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  Future<void> userRegister({
    required String username,
    required String email,
    required String password,
    required String phone,
    required File image,
    required String address,
  }) async {
    emit(const RegisterState.loading());

    try {
      FormData formData = FormData.fromMap({
        'Username': username,
        'Email': email,
        'Phone': phone,
        'Photo': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
        'Password': password,
        'Address': address,
      });
      var response = await ApiServeices().dio.post(
            'http://diabetes.runasp.net/api/Auth/register',
            data: formData,
          );
      print('response : ${response.data}');
      final registerModel = RegisterResponseBody.fromJson(response.data);
      var myPic = await SharedPrefHelper.setData(
          SharedPrefKeys.userPhotoUrl, registerModel.photoUrl);

      var myName = await SharedPrefHelper.setData(
          SharedPrefKeys.myName, registerModel.username);
      emit(RegisterState.success(registerModel));
    } catch (onError) {
      print('error : ${onError.toString()}');
      emit(RegisterState.error(error: onError.toString()));
    }
  }
}
