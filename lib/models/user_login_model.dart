
class UserLoginModel {
  String? userName;
  String? phoneNumber;
  String? email;
  String? password;
  String? confirmPassword;

  UserLoginModel(
      {this.userName,
        this.phoneNumber,
        this.email,
        this.password,
        this.confirmPassword});

  UserLoginModel.fromJson(Map<dynamic, dynamic> json) {
    userName = json['user_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}