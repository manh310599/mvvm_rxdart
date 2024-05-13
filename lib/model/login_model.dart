import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class login_model with _$login_model {
  const factory login_model({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) = _login_model;

  factory login_model.fromJson(Map<String, Object?> json) =>
      _$login_modelFromJson(json);
}
