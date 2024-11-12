import 'delete_doctor.dart';

class DeleteDatum {
	int? reservationId;
	DateTime? date;
	String? time;
	DeleteDoctor? doctor;

	DeleteDatum({this.reservationId, this.date, this.time, this.doctor});

	factory DeleteDatum.fromJson(Map<String, dynamic> json) => DeleteDatum(
				reservationId: json['reservationId'] as int?,
				date: json['date'] == null
						? null
						: DateTime.parse(json['date'] as String),
				time: json['time'] as String?,
				doctor: json['doctor'] == null
						? null
						: DeleteDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'reservationId': reservationId,
				'date': date?.toIso8601String(),
				'time': time,
				'doctor': doctor?.toJson(),
			};
}
