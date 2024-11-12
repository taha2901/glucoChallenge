import 'doctor.dart';

class FavouriteDoctorResponse {
	Doctor? doctor;

	FavouriteDoctorResponse({this.doctor});

	factory FavouriteDoctorResponse.fromJson(Map<String, dynamic> json) {
		return FavouriteDoctorResponse(
			doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'doctor': doctor?.toJson(),
			};
}
