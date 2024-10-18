class GetMedicineResponseBody {
	String? name;
	String? date;
	String? times;
	String? dosage;

	GetMedicineResponseBody({this.name, this.date, this.times, this.dosage});

	factory GetMedicineResponseBody.fromJson(Map<String, dynamic> json) {
		return GetMedicineResponseBody(
			name: json['name'] as String?,
			date: json['date'] as String?,
			times: json['times'] as String?,
			dosage: json['dosage'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'name': name,
				'date': date,
				'times': times,
				'dosage': dosage,
			};
}
