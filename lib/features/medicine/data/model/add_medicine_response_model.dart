class AddMedicineResponseBody {
	int? id;
	String? name;
	String? dosage;
	String? times;
	String? date;
	String? userId;
	List<dynamic>? users;

	AddMedicineResponseBody({
		this.id, 
		this.name, 
		this.dosage, 
		this.times, 
		this.date, 
		this.userId, 
		this.users, 
	});

	factory AddMedicineResponseBody.fromJson(Map<String, dynamic> json) {
		return AddMedicineResponseBody(
			id: json['id'] as int?,
			name: json['name'] as String?,
			dosage: json['dosage'] as String?,
			times: json['times'] as String?,
			date: json['date'] as String?,
			userId: json['user_Id'] as String?,
			users: json['users'] as List<dynamic>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'dosage': dosage,
				'times': times,
				'date': date,
				'user_Id': userId,
				'users': users,
			};
}
