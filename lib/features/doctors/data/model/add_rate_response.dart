class AddRateResponse {
  final String message;
  final double averageRate;

  AddRateResponse({
    required this.message,
    required this.averageRate,
  });

  factory AddRateResponse.fromJson(Map<String, dynamic> json) {
    return AddRateResponse(
      message: json['message'],
      averageRate: json['averageRate'],
    );
  }
}