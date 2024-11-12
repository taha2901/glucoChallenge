import 'doctor.dart';

class Datum {
	int? reservationId;
	DateTime? date;
	String? time;
	Doctor? doctor;

	Datum({this.reservationId, this.date, this.time, this.doctor});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				reservationId: json['reservationId'] as int?,
				date: json['date'] == null
						? null
						: DateTime.parse(json['date'] as String),
				time: json['time'] as String?,
				doctor: json['doctor'] == null
						? null
						: Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'reservationId': reservationId,
				'date': date?.toIso8601String(),
				'time': time,
				'doctor': doctor?.toJson(),
			};
}
