import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/networking/api_error_model.dart';
import 'package:challenge/core/networking/dio_factory.dart';
import 'package:challenge/features/favourite/logic/favourite_cubit.dart';
import 'package:challenge/features/login/logic/login_state.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/medical_record/logic/medical_record_cubit.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:challenge/features/settings/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/login_request_body.dart';
import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String formattedDate = DateHelper.getCurrentDate();

  void emitLoginState(BuildContext context) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (loginResponse) async {
        if (loginResponse.token != null) {
          await saveUserToken(loginResponse.token!);
          // await saveUserPassword(passwordController.text.trim());

          ProfileCubit.get(context).getUserData();
          context.read<MedicineCubit>().getMedicine();
          context.read<MeasurmentsCubit>().fetchSugarData(formattedDate);
          context.read<WeightCubit>().fetchWeightData(formattedDate);
          context.read<PressureCubit>().fetchPressureData(formattedDate);
          context.read<FavouriteCubit>().getFavourites();
          context.read<MedicalRecordCubit>().getMedicalRecord();

          emit(LoginState.success(loginResponse));
        } 
        else {
        // إذا لم يكن هناك توكن، نرسل خطأ
        emit(LoginState.error(ApiErrorModel(title: 'Token not found', status: 404)));
      }
      },
      failure: (error) {
        emit(LoginState.error(error));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  // Future<void> saveUserPassword(String password) async {
  //   await SharedPrefHelper.setData(SharedPrefKeys.userPassword, password);
  // }
}
