class ReservationResponseBody {
	String? message;
	ReservationModelDetails? data;

	ReservationResponseBody({this.message, this.data});

	factory ReservationResponseBody.fromJson(Map<String, dynamic> json) {
		return ReservationResponseBody(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: ReservationModelDetails.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}

class ReservationModelDetails {
	int? id;
	String? username;
	String? phone;
	int? age;
	String? sex;
	String? userId;
	int? doctorId;
	String? date;

	ReservationModelDetails({
		this.id, 
		this.username, 
		this.phone, 
		this.age, 
		this.sex, 
		this.userId, 
		this.doctorId, 
		this.date, 
	});

	factory ReservationModelDetails.fromJson(Map<String, dynamic> json) => ReservationModelDetails(
				id: json['id'] as int?,
				username: json['username'] as String?,
				phone: json['phone'] as String?,
				age: json['age'] as int?,
				sex: json['sex'] as String?,
				userId: json['user_Id'] as String?,
				doctorId: json['doctor_Id'] as int?,
				date: json['date'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'username': username,
				'phone': phone,
				'age': age,
				'sex': sex,
				'user_Id': userId,
				'doctor_Id': doctorId,
				'date': date,
			};
}
