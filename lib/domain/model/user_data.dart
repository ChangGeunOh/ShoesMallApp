import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

abstract class UserDataBase {}

class UserDataLoading extends UserDataBase {}
class UserDataError extends UserDataBase {}

@JsonSerializable()
class UserData extends UserDataBase {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  UserData({
    this.id = -1,
    this.username = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.image = '',
    this.token = '',
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
