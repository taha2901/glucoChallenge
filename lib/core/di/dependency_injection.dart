import 'package:challenge/core/networking/api_services.dart';
import 'package:challenge/core/networking/dio_factory.dart';
import 'package:challenge/features/doctors/data/repo/doctor_repo.dart';
import 'package:challenge/features/doctors/logic/doctors_cubit.dart';
import 'package:challenge/features/login/data/repo/login_repo.dart';
import 'package:challenge/features/login/logic/login_cubit.dart';
import 'package:challenge/features/measurments/data/repo/suger_measurments_repo.dart';
import 'package:challenge/features/measurments/data/repo/pressure_mesurment_repo.dart';
import 'package:challenge/features/measurments/data/repo/weight_measurment_repo.dart';
import 'package:challenge/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge/features/medicine/data/repo/medicine_repo.dart';
import 'package:challenge/features/medicine/logic/medicine_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setUpGetIt() async {
  //dio & ApiServices
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //Login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit()));

  //doctors
  getit.registerLazySingleton<DoctorRepo>(() => DoctorRepo(getit()));
  getit.registerFactory<DoctorsCubit>(() => DoctorsCubit(getit()));

  //medicine
  getit.registerLazySingleton<MedicineRepo>(() => MedicineRepo(getit()));
  getit.registerFactory<MedicineCubit>(() => MedicineCubit(getit()));

  //measurements
  getit.registerLazySingleton<MeasurmentRepo>(() => MeasurmentRepo(getit()));
  getit.registerFactory<MeasurmentsCubit>(() => MeasurmentsCubit(getit()));

  //weight
  getit.registerLazySingleton<WeightMeasurmentRepo>(
      () => WeightMeasurmentRepo(getit()));
  getit.registerFactory<WeightCubit>(() => WeightCubit(getit()));

  //pressure
  getit.registerLazySingleton<PressureMeasurmentRepo>(
      () => PressureMeasurmentRepo(getit()));
  getit.registerFactory<PressureCubit>(() => PressureCubit(getit()));
}
