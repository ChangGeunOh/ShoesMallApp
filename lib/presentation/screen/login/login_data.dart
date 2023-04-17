class LoginData {
  final String userid;
  final String passwd;

  LoginData({
    this.userid = '',
    this.passwd = '',
  });

  LoginData copyWith({String? userid, String? passwd}) {
    return LoginData(
      userid: userid ?? this.userid,
      passwd: passwd ?? this.passwd,
    );
  }
}
