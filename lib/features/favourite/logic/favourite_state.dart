import 'package:challenge/features/favourite/data/models/favourite_doctor_response/favourite_doctor_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_state.freezed.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;

  // حالات المفضلة
  const factory FavouriteState.favouriteLoading() = FavouriteLoading;
  const factory FavouriteState.favouriteSuccess({required List<FavouriteDoctorResponse> data}) = FavouriteSuccess;
  const factory FavouriteState.favouriteError({required String message}) = FavouriteError;

  // حالات إضافة أو إزالة المفضلة
  const factory FavouriteState.addOrRemoveFavouriteLoading() = AddOrRemoveFavouriteLoading;
  const factory FavouriteState.addOrRemoveFavouriteSuccess() = AddOrRemoveFavouriteSuccess;

  const factory FavouriteState.addOrRemoveFavouriteError({required String message}) = AddOrRemoveFavouriteError;
}
