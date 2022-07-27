class CustomerModel {
  CustomerModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.cPassword,
  });

  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? cPassword;

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "username": email,
      };
}
