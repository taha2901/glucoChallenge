class DeleteDoctor {
	int? doctorId;
	String? name;
	String? specialty;
	String? phone;
	String? email;
	String? address;
  String? photo;
  int? price;

	DeleteDoctor({
		this.doctorId, 
		this.name, 
		this.specialty, 
		this.phone, 
		this.email, 
		this.address, 
    this.photo,
    this.price
	});

	factory DeleteDoctor.fromJson(Map<String, dynamic> json) => DeleteDoctor(
				doctorId: json['doctorId'] as int?,
				name: json['name'] as String?,
				specialty: json['specialty'] as String?,
				phone: json['phone'] as String?,
				email: json['email'] as String?,
				address: json['address'] as String?,
        photo: json['photo'] as String?,
        price: json['price'] as int?
			);

	Map<String, dynamic> toJson() => {
				'doctorId': doctorId,
				'name': name,
				'specialty': specialty,
				'phone': phone,
				'email': email,
				'address': address,
        'photo': photo,
        'price': price
			};
}
