import 'datum.dart';

class MedicalRecord {
	String? message;
	List<Datum>? data;

	MedicalRecord({this.message, this.data});

	factory MedicalRecord.fromJson(Map<String, dynamic> json) => MedicalRecord(
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
