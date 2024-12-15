import 'datum.dart';

class DeleteMedicalRecord {
	String? message;
	List<DeleteDatum>? data;

	DeleteMedicalRecord({this.message, this.data});

	factory DeleteMedicalRecord.fromJson(Map<String, dynamic> json) => DeleteMedicalRecord(
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => DeleteDatum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
