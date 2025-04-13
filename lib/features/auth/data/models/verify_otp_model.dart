class VerifyOTPModel {
  final String email;
  final String otp;

  VerifyOTPModel({required this.email, required this.otp});

  Map<String, dynamic> toJson() {
    return {
      "email" : email,
      "otp" : otp
    };
}

}