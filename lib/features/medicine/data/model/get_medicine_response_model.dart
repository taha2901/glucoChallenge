class GetMedicineResponseBody {
  int? id;
	String? name;
	String? date;
	String? times;
	String? dosage;

	GetMedicineResponseBody({this.name, this.date, this.times, this.dosage,this.id});

	factory GetMedicineResponseBody.fromJson(Map<String, dynamic> json) {
		return GetMedicineResponseBody(
			name: json['name'] as String?,
			date: json['date'] as String?,
			times: json['times'] as String?,
			dosage: json['dosage'] as String?,
      id: json['id'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'name': name,
				'date': date,
				'times': times,
				'dosage': dosage,
			};
}
