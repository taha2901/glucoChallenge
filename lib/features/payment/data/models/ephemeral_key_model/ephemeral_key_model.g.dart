// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EphemeralKeyModel _$EphemeralKeyModelFromJson(Map<String, dynamic> json) =>
    EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associatedObjects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: (json['created'] as num?)?.toInt(),
      expires: (json['expires'] as num?)?.toInt(),
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );

Map<String, dynamic> _$EphemeralKeyModelToJson(EphemeralKeyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'associatedObjects': instance.associatedObjects,
      'created': instance.created,
      'expires': instance.expires,
      'livemode': instance.livemode,
      'secret': instance.secret,
    };

AssociatedObject _$AssociatedObjectFromJson(Map<String, dynamic> json) =>
    AssociatedObject(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AssociatedObjectToJson(AssociatedObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
