// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'unplash_model.freezed.dart';
part 'unplash_model.g.dart';

@freezed
abstract class ListPhotosApiResponse with _$ListPhotosApiResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ListPhotosApiResponse({
    required int total,
    required int totalPages,
    required List<Photo> results,
  }) = _ListPhotosApiResponse;

  factory ListPhotosApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPhotosApiResponseFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Photo({
    required String id,
    required String createdAt,
    required int width,
    required int height,
    required String color,
    required String blurHash,
    required int likes,
    required bool likedByUser,
    required User user,
    required List<dynamic> currentUserCollections,
    required PhotoUrls urls,
    required PhotoLinks links,
    String? description,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory User({
    required String id,
    required String username,
    required String name,
    required String firstName,
    required String lastName,
    required ProfileImage profileImage,
    required UserLinks links,
    String? instagramUsername,
    String? twitterUsername,
    String? portfolioUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class ProfileImage with _$ProfileImage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProfileImage({
    required String small,
    required String medium,
    required String large,
  }) = _ProfileImage;

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);
}

@freezed
abstract class UserLinks with _$UserLinks {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserLinks({
    required String self,
    required String html,
    required String photos,
    required String likes,
  }) = _UserLinks;

  factory UserLinks.fromJson(Map<String, dynamic> json) =>
      _$UserLinksFromJson(json);
}

@freezed
abstract class PhotoUrls with _$PhotoUrls {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory PhotoUrls({
    required String raw,
    required String full,
    required String regular,
    required String small,
    required String thumb,
  }) = _PhotoUrls;

  factory PhotoUrls.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsFromJson(json);
}

@freezed
abstract class PhotoLinks with _$PhotoLinks {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory PhotoLinks({
    required String self,
    required String html,
    required String download,
  }) = _PhotoLinks;

  factory PhotoLinks.fromJson(Map<String, dynamic> json) =>
      _$PhotoLinksFromJson(json);
}
