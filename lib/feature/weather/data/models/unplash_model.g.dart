// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unplash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListPhotosApiResponse _$ListPhotosApiResponseFromJson(
  Map<String, dynamic> json,
) => _ListPhotosApiResponse(
  total: (json['total'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  results:
      (json['results'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ListPhotosApiResponseToJson(
  _ListPhotosApiResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'total_pages': instance.totalPages,
  'results': instance.results,
};

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  id: json['id'] as String,
  createdAt: json['created_at'] as String,
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  color: json['color'] as String,
  blurHash: json['blur_hash'] as String,
  likes: (json['likes'] as num).toInt(),
  likedByUser: json['liked_by_user'] as bool,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  currentUserCollections: json['current_user_collections'] as List<dynamic>,
  urls: PhotoUrls.fromJson(json['urls'] as Map<String, dynamic>),
  links: PhotoLinks.fromJson(json['links'] as Map<String, dynamic>),
  description: json['description'] as String?,
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'width': instance.width,
  'height': instance.height,
  'color': instance.color,
  'blur_hash': instance.blurHash,
  'likes': instance.likes,
  'liked_by_user': instance.likedByUser,
  'user': instance.user,
  'current_user_collections': instance.currentUserCollections,
  'urls': instance.urls,
  'links': instance.links,
  'description': instance.description,
};

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  name: json['name'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  profileImage: ProfileImage.fromJson(
    json['profile_image'] as Map<String, dynamic>,
  ),
  links: UserLinks.fromJson(json['links'] as Map<String, dynamic>),
  instagramUsername: json['instagram_username'] as String?,
  twitterUsername: json['twitter_username'] as String?,
  portfolioUrl: json['portfolio_url'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'name': instance.name,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'profile_image': instance.profileImage,
  'links': instance.links,
  'instagram_username': instance.instagramUsername,
  'twitter_username': instance.twitterUsername,
  'portfolio_url': instance.portfolioUrl,
};

_ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) =>
    _ProfileImage(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$ProfileImageToJson(_ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

_UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => _UserLinks(
  self: json['self'] as String,
  html: json['html'] as String,
  photos: json['photos'] as String,
  likes: json['likes'] as String,
);

Map<String, dynamic> _$UserLinksToJson(_UserLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'photos': instance.photos,
      'likes': instance.likes,
    };

_PhotoUrls _$PhotoUrlsFromJson(Map<String, dynamic> json) => _PhotoUrls(
  raw: json['raw'] as String,
  full: json['full'] as String,
  regular: json['regular'] as String,
  small: json['small'] as String,
  thumb: json['thumb'] as String,
);

Map<String, dynamic> _$PhotoUrlsToJson(_PhotoUrls instance) =>
    <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
    };

_PhotoLinks _$PhotoLinksFromJson(Map<String, dynamic> json) => _PhotoLinks(
  self: json['self'] as String,
  html: json['html'] as String,
  download: json['download'] as String,
);

Map<String, dynamic> _$PhotoLinksToJson(_PhotoLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
    };
