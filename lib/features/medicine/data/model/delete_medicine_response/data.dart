class Data {
	int? id;
	String? name;
	String? dosage;
	String? times;
	String? time;
	String? userId;
	List<dynamic>? users;

	Data({
		this.id, 
		this.name, 
		this.dosage, 
		this.times, 
		this.time, 
		this.userId, 
		this.users, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				name: json['name'] as String?,
				dosage: json['dosage'] as String?,
				times: json['times'] as String?,
				time: json['time'] as String?,
				userId: json['user_Id'] as String?,
				users: json['users'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'dosage': dosage,
				'times': times,
				'time': time,
				'user_Id': userId,
				'users': users,
			};
}
