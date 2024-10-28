import 'package:json_annotation/json_annotation.dart';

part 'available_time_response.g.dart';

@JsonSerializable()
class AvailableTimesResponse {
  final List<DateTime> availableTimes;

  AvailableTimesResponse({required this.availableTimes});

  factory AvailableTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimesResponseFromJson(json);
}
