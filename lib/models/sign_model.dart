class Login {
 late bool success;
 late String message;


  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

}
