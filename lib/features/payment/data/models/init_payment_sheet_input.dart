class InitiPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitiPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });

  Map<String, dynamic> toJson() => {
        'client_secret': clientSecret,
        'customer_id': customerId,
        'ephemeral_key_secret': ephemeralKeySecret
      };
  
       
       //fromjson

  factory InitiPaymentSheetInputModel.fromJson(Map<String, dynamic> json) {
    return InitiPaymentSheetInputModel(
      clientSecret: json['client_secret'] as String,
      customerId: json['customer_id'] as String,
      ephemeralKeySecret: json['ephemeral_key_secret'] as String,
    
  );
  }
}
