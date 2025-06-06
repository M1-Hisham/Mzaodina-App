import 'package:json_annotation/json_annotation.dart';

part 'update_profile_body.g.dart';

@JsonSerializable()
class UpdateProfileBody {
  String? name;
  String? username;
  String? email;
  String? phone;
  @JsonKey(name: 'phone_country_code')
  String? phoneCountryCode;
  String? country;
  String? city;
  String? street;
  String? neighborhood;
  UpdateProfileBody({
    this.name,
    this.username,
    this.email,
    this.phone,
    this.phoneCountryCode,
    this.country,
    this.city,
    this.street,
    this.neighborhood,
  });
  factory UpdateProfileBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileBodyToJson(this);
  UpdateProfileBody copyWith({
    String? name,
    String? username,
    String? email,
    String? phone,
    String? phoneCountryCode,
    String? country,
    String? city,
    String? street,
    String? neighborhood,
  }) {
    return UpdateProfileBody(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
      country: country ?? this.country,
      city: city ?? this.city,
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
    );
  }
}
