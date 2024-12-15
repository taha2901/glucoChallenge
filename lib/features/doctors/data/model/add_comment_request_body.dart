import 'package:json_annotation/json_annotation.dart';

part 'add_comment_request_body.g.dart';

@JsonSerializable()
class AddCommentRequestBody {
  final int id;
  final int doctorId;
  final String content;
  final String createdAt;
  final String userName;
  final String userProfilePictureUrl;
  final String userId;

  AddCommentRequestBody({
    required this.id,
    required this.doctorId,
    required this.content,
    required this.createdAt,
    required this.userName,
    required this.userProfilePictureUrl,
    required this.userId,
  });


  Map<String, dynamic> toJson() => _$AddCommentRequestBodyToJson(this);
}
