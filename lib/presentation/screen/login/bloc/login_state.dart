class LoginState {
  final String userid;
  final String password;
  final bool isLoading;
  final bool isCertified;

  LoginState({
    this.userid = '',
    this.password = '',
    this.isLoading = false,
    this.isCertified = false,
  });

  LoginState copyWith({
    String? userid,
    String? password,
    bool? isLoading,
    bool? isCertified,
  }) {
    return LoginState(
      userid: userid ?? this.userid,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isCertified: isCertified ?? this.isCertified,
    );
  }

  @override
  String toString() {
    return 'LoginState{userid: $userid, password: $password, isLoading: $isLoading, isCertified: $isCertified}';
  }
}
