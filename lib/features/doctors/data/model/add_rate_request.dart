class AddRateRequest {
  final int doctorId;
  final int userRate;

  AddRateRequest({required this.doctorId, required this.userRate});


  //toJson
  Map<String, dynamic> toJson() => {
    'doctorId': doctorId,
    'userRate': userRate,
  };
}