import 'data.dart';

class DeleteMedicineResponse {
	String? message;
	Data? data;

	DeleteMedicineResponse({this.message, this.data});

	factory DeleteMedicineResponse.fromJson(Map<String, dynamic> json) {
		return DeleteMedicineResponse(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}
