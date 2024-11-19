class AgreementModel{
  String? userEmail;
  int? eulaVersion;

  AgreementModel({
    required this.userEmail,
    required this.eulaVersion
  });

  AgreementModel.fromJson(Map<String, dynamic> json){
    userEmail = json["user_email"];
    eulaVersion = json["eula_version"];
  }
}