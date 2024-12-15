// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentRequestBody _$AddCommentRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddCommentRequestBody(
      id: (json['id'] as num).toInt(),
      doctorId: (json['doctorId'] as num).toInt(),
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      userName: json['userName'] as String,
      userProfilePictureUrl: json['userProfilePictureUrl'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$AddCommentRequestBodyToJson(
        AddCommentRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'userName': instance.userName,
      'userProfilePictureUrl': instance.userProfilePictureUrl,
      'userId': instance.userId,
    };
