import 'package:bloc/bloc.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_request.dart';
import 'package:challenge/features/favourite/data/models/add_or_remove_doctor_favourite_response.dart';
import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:challenge/features/favourite/data/repo/favourite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  static FavouriteCubit of(context) => BlocProvider.of(context);

  final FavouriteRepo _favouriteRepo;
  AddOrRemoveFavouriteResponseModel? addOrRemoveFavouriteData;
  List<FavouriteDoctorResponse> favouriteList = [];
  Set<String> favoriteIDs = {};

  FavouriteCubit(this._favouriteRepo) : super(const FavouriteState.initial());

  // جلب قائمة الأطباء المفضلين
  Future<void> getFavourites() async {
    emit(const FavouriteState.favouriteLoading());

    final result = await _favouriteRepo.getFavourite();
    result.when(
      success: (data) {
        favouriteList = data;
        favoriteIDs.clear();
        // تحديث قائمة المفضلة وحفظ IDs
        favouriteList.forEach((element) {
          favoriteIDs.add(element.doctor!.id.toString());
        });
        emit(FavouriteState.favouriteSuccess(data: data));
      },
      failure: (failure) {
        emit(FavouriteState.favouriteError(
          message: failure.getAllErrorMessages(),
        ));
      },
    );
  }

  // إضافة أو إزالة طبيب من المفضلة
  Future<void> addOrRemoveFavourite({required int doctorId}) async {
    // إرسال حالة تحميل
    emit(const FavouriteState.addOrRemoveFavouriteLoading());

    final result = await _favouriteRepo.addOrRemoveFavourite(
      AddOrRemoveFavouriteRequestModel(doctorId: doctorId, userId: 'string'),
    );

    result.when(
      success: (data) {
        addOrRemoveFavouriteData = data;

        if (favoriteIDs.contains(doctorId.toString())) {
          favoriteIDs.remove(doctorId.toString());
          // getFavourites();
        } else {
          favoriteIDs.add(doctorId.toString());
          // getFavourites();
        }
        getFavourites();
        emit(FavouriteState.addOrRemoveFavouriteSuccess());
      },
      failure: (failure) {
        emit(FavouriteState.addOrRemoveFavouriteError( message: failure.getAllErrorMessages()));
      },
    );
  }
}