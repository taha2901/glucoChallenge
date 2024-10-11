import 'package:challenge/core/helpers/constants.dart';
import 'package:challenge/core/helpers/shared_pref_helper.dart';
import 'package:challenge/core/networking/dio_factory.dart';
import 'package:challenge/features/login/logic/login_state.dart';
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

  void emitLoginState(context) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (loginResponse) async {
         await saveUserToken(loginResponse.token!);
          await saveUserPassword(passwordController.text.trim());

          // ProfileCubit.get(context).getUserData();
          // FavouriteCubit.of(context).getFavourites();
          // CartCubit.get(context).getCart();
          debugPrint('Login success ${loginResponse.token}');
          emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        debugPrint('Login failed: ${error}');
        emit(LoginState.error(error:  error.toString()));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveUserPassword(String password) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userPassword, password);
  }
}
