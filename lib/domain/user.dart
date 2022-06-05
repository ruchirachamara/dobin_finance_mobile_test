class User {
  int userId;
  String name;
  String token;
  String renewalToken;

  User({this.userId, this.name, this.token, this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }
}
