class DoctorCommentResponse {
	int? id;
	int? doctorId;
	String? content;
	String? createdAt;
	String? userName;
	String? userProfilePictureUrl;
	String? userId;

	DoctorCommentResponse({
		this.id, 
		this.doctorId, 
		this.content, 
		this.createdAt, 
		this.userName, 
		this.userProfilePictureUrl, 
		this.userId, 
	});

	factory DoctorCommentResponse.fromJson(Map<String, dynamic> json) {
		return DoctorCommentResponse(
			id: json['id'] as int?,
			doctorId: json['doctorId'] as int?,
			content: json['content'] as String?,
			// createdAt: json['createdAt'] == null
			// 			? null
			// 			: DateTime.parse(json['createdAt'] as String),

      createdAt: json['createdAt'] as String?,
			userName: json['userName'] as String?,
			userProfilePictureUrl: json['userProfilePictureUrl'] as String?,
			userId: json['userId'] as String?,
		);
	}



	// Map<String, dynamic> toJson() => {
	// 			'id': id,
	// 			'doctorId': doctorId,
	// 			'content': content,
	// 			'createdAt': createdAt?.toIso8601String(),
	// 			'userName': userName,
	// 			'userProfilePictureUrl': userProfilePictureUrl,
	// 			'userId': userId,
	// 		};
}
