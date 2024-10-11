import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? title;
  final int? status;
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.title,
    this.status,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorMessage() {
    if (errors != null && errors!.isNotEmpty) {
      final errorMessage = errors!.entries.map((e) {
        final value = e.value;
        return "${value.join(', ')}";
      }).join('\n');
      return errorMessage;
    } else {
      return 'Something went wrong';
    }
  }
}

// @JsonSerializable()
// class ApiErrorDetails {
//   final List<String>? sex;

//   ApiErrorDetails({
//     this.sex,
//   });

//   factory ApiErrorDetails.fromJson(Map<String, dynamic> json) =>
//       _$ApiErrorDetailsFromJson(json);

//   Map<String, dynamic> toJson() => _$ApiErrorDetailsToJson(this);


  
// }
