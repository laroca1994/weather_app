// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unplash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListPhotosApiResponse {

 int get total; int get totalPages; List<Photo> get results;
/// Create a copy of ListPhotosApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListPhotosApiResponseCopyWith<ListPhotosApiResponse> get copyWith => _$ListPhotosApiResponseCopyWithImpl<ListPhotosApiResponse>(this as ListPhotosApiResponse, _$identity);

  /// Serializes this ListPhotosApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListPhotosApiResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,totalPages,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ListPhotosApiResponse(total: $total, totalPages: $totalPages, results: $results)';
}


}

/// @nodoc
abstract mixin class $ListPhotosApiResponseCopyWith<$Res>  {
  factory $ListPhotosApiResponseCopyWith(ListPhotosApiResponse value, $Res Function(ListPhotosApiResponse) _then) = _$ListPhotosApiResponseCopyWithImpl;
@useResult
$Res call({
 int total, int totalPages, List<Photo> results
});




}
/// @nodoc
class _$ListPhotosApiResponseCopyWithImpl<$Res>
    implements $ListPhotosApiResponseCopyWith<$Res> {
  _$ListPhotosApiResponseCopyWithImpl(this._self, this._then);

  final ListPhotosApiResponse _self;
  final $Res Function(ListPhotosApiResponse) _then;

/// Create a copy of ListPhotosApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? totalPages = null,Object? results = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ListPhotosApiResponse implements ListPhotosApiResponse {
   _ListPhotosApiResponse({required this.total, required this.totalPages, required final  List<Photo> results}): _results = results;
  factory _ListPhotosApiResponse.fromJson(Map<String, dynamic> json) => _$ListPhotosApiResponseFromJson(json);

@override final  int total;
@override final  int totalPages;
 final  List<Photo> _results;
@override List<Photo> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ListPhotosApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListPhotosApiResponseCopyWith<_ListPhotosApiResponse> get copyWith => __$ListPhotosApiResponseCopyWithImpl<_ListPhotosApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListPhotosApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListPhotosApiResponse&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,totalPages,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ListPhotosApiResponse(total: $total, totalPages: $totalPages, results: $results)';
}


}

/// @nodoc
abstract mixin class _$ListPhotosApiResponseCopyWith<$Res> implements $ListPhotosApiResponseCopyWith<$Res> {
  factory _$ListPhotosApiResponseCopyWith(_ListPhotosApiResponse value, $Res Function(_ListPhotosApiResponse) _then) = __$ListPhotosApiResponseCopyWithImpl;
@override @useResult
$Res call({
 int total, int totalPages, List<Photo> results
});




}
/// @nodoc
class __$ListPhotosApiResponseCopyWithImpl<$Res>
    implements _$ListPhotosApiResponseCopyWith<$Res> {
  __$ListPhotosApiResponseCopyWithImpl(this._self, this._then);

  final _ListPhotosApiResponse _self;
  final $Res Function(_ListPhotosApiResponse) _then;

/// Create a copy of ListPhotosApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? totalPages = null,Object? results = null,}) {
  return _then(_ListPhotosApiResponse(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}


}


/// @nodoc
mixin _$Photo {

 String get id; String get createdAt; int get width; int get height; String get color; String get blurHash; int get likes; bool get likedByUser; User get user; List<dynamic> get currentUserCollections; PhotoUrls get urls; PhotoLinks get links; String? get description;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.color, color) || other.color == color)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.likedByUser, likedByUser) || other.likedByUser == likedByUser)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.currentUserCollections, currentUserCollections)&&(identical(other.urls, urls) || other.urls == urls)&&(identical(other.links, links) || other.links == links)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,width,height,color,blurHash,likes,likedByUser,user,const DeepCollectionEquality().hash(currentUserCollections),urls,links,description);

@override
String toString() {
  return 'Photo(id: $id, createdAt: $createdAt, width: $width, height: $height, color: $color, blurHash: $blurHash, likes: $likes, likedByUser: $likedByUser, user: $user, currentUserCollections: $currentUserCollections, urls: $urls, links: $links, description: $description)';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
 String id, String createdAt, int width, int height, String color, String blurHash, int likes, bool likedByUser, User user, List<dynamic> currentUserCollections, PhotoUrls urls, PhotoLinks links, String? description
});


$UserCopyWith<$Res> get user;$PhotoUrlsCopyWith<$Res> get urls;$PhotoLinksCopyWith<$Res> get links;

}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? width = null,Object? height = null,Object? color = null,Object? blurHash = null,Object? likes = null,Object? likedByUser = null,Object? user = null,Object? currentUserCollections = null,Object? urls = null,Object? links = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,likedByUser: null == likedByUser ? _self.likedByUser : likedByUser // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,currentUserCollections: null == currentUserCollections ? _self.currentUserCollections : currentUserCollections // ignore: cast_nullable_to_non_nullable
as List<dynamic>,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as PhotoUrls,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PhotoLinks,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoUrlsCopyWith<$Res> get urls {
  
  return $PhotoUrlsCopyWith<$Res>(_self.urls, (value) {
    return _then(_self.copyWith(urls: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoLinksCopyWith<$Res> get links {
  
  return $PhotoLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Photo implements Photo {
   _Photo({required this.id, required this.createdAt, required this.width, required this.height, required this.color, required this.blurHash, required this.likes, required this.likedByUser, required this.user, required final  List<dynamic> currentUserCollections, required this.urls, required this.links, this.description}): _currentUserCollections = currentUserCollections;
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

@override final  String id;
@override final  String createdAt;
@override final  int width;
@override final  int height;
@override final  String color;
@override final  String blurHash;
@override final  int likes;
@override final  bool likedByUser;
@override final  User user;
 final  List<dynamic> _currentUserCollections;
@override List<dynamic> get currentUserCollections {
  if (_currentUserCollections is EqualUnmodifiableListView) return _currentUserCollections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentUserCollections);
}

@override final  PhotoUrls urls;
@override final  PhotoLinks links;
@override final  String? description;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.color, color) || other.color == color)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.likedByUser, likedByUser) || other.likedByUser == likedByUser)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._currentUserCollections, _currentUserCollections)&&(identical(other.urls, urls) || other.urls == urls)&&(identical(other.links, links) || other.links == links)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,width,height,color,blurHash,likes,likedByUser,user,const DeepCollectionEquality().hash(_currentUserCollections),urls,links,description);

@override
String toString() {
  return 'Photo(id: $id, createdAt: $createdAt, width: $width, height: $height, color: $color, blurHash: $blurHash, likes: $likes, likedByUser: $likedByUser, user: $user, currentUserCollections: $currentUserCollections, urls: $urls, links: $links, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String createdAt, int width, int height, String color, String blurHash, int likes, bool likedByUser, User user, List<dynamic> currentUserCollections, PhotoUrls urls, PhotoLinks links, String? description
});


@override $UserCopyWith<$Res> get user;@override $PhotoUrlsCopyWith<$Res> get urls;@override $PhotoLinksCopyWith<$Res> get links;

}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? width = null,Object? height = null,Object? color = null,Object? blurHash = null,Object? likes = null,Object? likedByUser = null,Object? user = null,Object? currentUserCollections = null,Object? urls = null,Object? links = null,Object? description = freezed,}) {
  return _then(_Photo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,likedByUser: null == likedByUser ? _self.likedByUser : likedByUser // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,currentUserCollections: null == currentUserCollections ? _self._currentUserCollections : currentUserCollections // ignore: cast_nullable_to_non_nullable
as List<dynamic>,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as PhotoUrls,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as PhotoLinks,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoUrlsCopyWith<$Res> get urls {
  
  return $PhotoUrlsCopyWith<$Res>(_self.urls, (value) {
    return _then(_self.copyWith(urls: value));
  });
}/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoLinksCopyWith<$Res> get links {
  
  return $PhotoLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc
mixin _$User {

 String get id; String get username; String get name; String get firstName; String get lastName; ProfileImage get profileImage; UserLinks get links; String? get instagramUsername; String? get twitterUsername; String? get portfolioUrl;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.links, links) || other.links == links)&&(identical(other.instagramUsername, instagramUsername) || other.instagramUsername == instagramUsername)&&(identical(other.twitterUsername, twitterUsername) || other.twitterUsername == twitterUsername)&&(identical(other.portfolioUrl, portfolioUrl) || other.portfolioUrl == portfolioUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,firstName,lastName,profileImage,links,instagramUsername,twitterUsername,portfolioUrl);

@override
String toString() {
  return 'User(id: $id, username: $username, name: $name, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, links: $links, instagramUsername: $instagramUsername, twitterUsername: $twitterUsername, portfolioUrl: $portfolioUrl)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String username, String name, String firstName, String lastName, ProfileImage profileImage, UserLinks links, String? instagramUsername, String? twitterUsername, String? portfolioUrl
});


$ProfileImageCopyWith<$Res> get profileImage;$UserLinksCopyWith<$Res> get links;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? name = null,Object? firstName = null,Object? lastName = null,Object? profileImage = null,Object? links = null,Object? instagramUsername = freezed,Object? twitterUsername = freezed,Object? portfolioUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as ProfileImage,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as UserLinks,instagramUsername: freezed == instagramUsername ? _self.instagramUsername : instagramUsername // ignore: cast_nullable_to_non_nullable
as String?,twitterUsername: freezed == twitterUsername ? _self.twitterUsername : twitterUsername // ignore: cast_nullable_to_non_nullable
as String?,portfolioUrl: freezed == portfolioUrl ? _self.portfolioUrl : portfolioUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileImageCopyWith<$Res> get profileImage {
  
  return $ProfileImageCopyWith<$Res>(_self.profileImage, (value) {
    return _then(_self.copyWith(profileImage: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLinksCopyWith<$Res> get links {
  
  return $UserLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _User implements User {
   _User({required this.id, required this.username, required this.name, required this.firstName, required this.lastName, required this.profileImage, required this.links, this.instagramUsername, this.twitterUsername, this.portfolioUrl});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String username;
@override final  String name;
@override final  String firstName;
@override final  String lastName;
@override final  ProfileImage profileImage;
@override final  UserLinks links;
@override final  String? instagramUsername;
@override final  String? twitterUsername;
@override final  String? portfolioUrl;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.links, links) || other.links == links)&&(identical(other.instagramUsername, instagramUsername) || other.instagramUsername == instagramUsername)&&(identical(other.twitterUsername, twitterUsername) || other.twitterUsername == twitterUsername)&&(identical(other.portfolioUrl, portfolioUrl) || other.portfolioUrl == portfolioUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,firstName,lastName,profileImage,links,instagramUsername,twitterUsername,portfolioUrl);

@override
String toString() {
  return 'User(id: $id, username: $username, name: $name, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, links: $links, instagramUsername: $instagramUsername, twitterUsername: $twitterUsername, portfolioUrl: $portfolioUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String name, String firstName, String lastName, ProfileImage profileImage, UserLinks links, String? instagramUsername, String? twitterUsername, String? portfolioUrl
});


@override $ProfileImageCopyWith<$Res> get profileImage;@override $UserLinksCopyWith<$Res> get links;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? name = null,Object? firstName = null,Object? lastName = null,Object? profileImage = null,Object? links = null,Object? instagramUsername = freezed,Object? twitterUsername = freezed,Object? portfolioUrl = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as ProfileImage,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as UserLinks,instagramUsername: freezed == instagramUsername ? _self.instagramUsername : instagramUsername // ignore: cast_nullable_to_non_nullable
as String?,twitterUsername: freezed == twitterUsername ? _self.twitterUsername : twitterUsername // ignore: cast_nullable_to_non_nullable
as String?,portfolioUrl: freezed == portfolioUrl ? _self.portfolioUrl : portfolioUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileImageCopyWith<$Res> get profileImage {
  
  return $ProfileImageCopyWith<$Res>(_self.profileImage, (value) {
    return _then(_self.copyWith(profileImage: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLinksCopyWith<$Res> get links {
  
  return $UserLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// @nodoc
mixin _$ProfileImage {

 String get small; String get medium; String get large;
/// Create a copy of ProfileImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileImageCopyWith<ProfileImage> get copyWith => _$ProfileImageCopyWithImpl<ProfileImage>(this as ProfileImage, _$identity);

  /// Serializes this ProfileImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileImage&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,small,medium,large);

@override
String toString() {
  return 'ProfileImage(small: $small, medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class $ProfileImageCopyWith<$Res>  {
  factory $ProfileImageCopyWith(ProfileImage value, $Res Function(ProfileImage) _then) = _$ProfileImageCopyWithImpl;
@useResult
$Res call({
 String small, String medium, String large
});




}
/// @nodoc
class _$ProfileImageCopyWithImpl<$Res>
    implements $ProfileImageCopyWith<$Res> {
  _$ProfileImageCopyWithImpl(this._self, this._then);

  final ProfileImage _self;
  final $Res Function(ProfileImage) _then;

/// Create a copy of ProfileImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? small = null,Object? medium = null,Object? large = null,}) {
  return _then(_self.copyWith(
small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ProfileImage implements ProfileImage {
   _ProfileImage({required this.small, required this.medium, required this.large});
  factory _ProfileImage.fromJson(Map<String, dynamic> json) => _$ProfileImageFromJson(json);

@override final  String small;
@override final  String medium;
@override final  String large;

/// Create a copy of ProfileImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileImageCopyWith<_ProfileImage> get copyWith => __$ProfileImageCopyWithImpl<_ProfileImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileImage&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,small,medium,large);

@override
String toString() {
  return 'ProfileImage(small: $small, medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class _$ProfileImageCopyWith<$Res> implements $ProfileImageCopyWith<$Res> {
  factory _$ProfileImageCopyWith(_ProfileImage value, $Res Function(_ProfileImage) _then) = __$ProfileImageCopyWithImpl;
@override @useResult
$Res call({
 String small, String medium, String large
});




}
/// @nodoc
class __$ProfileImageCopyWithImpl<$Res>
    implements _$ProfileImageCopyWith<$Res> {
  __$ProfileImageCopyWithImpl(this._self, this._then);

  final _ProfileImage _self;
  final $Res Function(_ProfileImage) _then;

/// Create a copy of ProfileImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? small = null,Object? medium = null,Object? large = null,}) {
  return _then(_ProfileImage(
small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,large: null == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserLinks {

 String get self; String get html; String get photos; String get likes;
/// Create a copy of UserLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLinksCopyWith<UserLinks> get copyWith => _$UserLinksCopyWithImpl<UserLinks>(this as UserLinks, _$identity);

  /// Serializes this UserLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLinks&&(identical(other.self, self) || other.self == self)&&(identical(other.html, html) || other.html == html)&&(identical(other.photos, photos) || other.photos == photos)&&(identical(other.likes, likes) || other.likes == likes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,html,photos,likes);

@override
String toString() {
  return 'UserLinks(self: $self, html: $html, photos: $photos, likes: $likes)';
}


}

/// @nodoc
abstract mixin class $UserLinksCopyWith<$Res>  {
  factory $UserLinksCopyWith(UserLinks value, $Res Function(UserLinks) _then) = _$UserLinksCopyWithImpl;
@useResult
$Res call({
 String self, String html, String photos, String likes
});




}
/// @nodoc
class _$UserLinksCopyWithImpl<$Res>
    implements $UserLinksCopyWith<$Res> {
  _$UserLinksCopyWithImpl(this._self, this._then);

  final UserLinks _self;
  final $Res Function(UserLinks) _then;

/// Create a copy of UserLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? self = null,Object? html = null,Object? photos = null,Object? likes = null,}) {
  return _then(_self.copyWith(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UserLinks implements UserLinks {
   _UserLinks({required this.self, required this.html, required this.photos, required this.likes});
  factory _UserLinks.fromJson(Map<String, dynamic> json) => _$UserLinksFromJson(json);

@override final  String self;
@override final  String html;
@override final  String photos;
@override final  String likes;

/// Create a copy of UserLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLinksCopyWith<_UserLinks> get copyWith => __$UserLinksCopyWithImpl<_UserLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLinks&&(identical(other.self, self) || other.self == self)&&(identical(other.html, html) || other.html == html)&&(identical(other.photos, photos) || other.photos == photos)&&(identical(other.likes, likes) || other.likes == likes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,html,photos,likes);

@override
String toString() {
  return 'UserLinks(self: $self, html: $html, photos: $photos, likes: $likes)';
}


}

/// @nodoc
abstract mixin class _$UserLinksCopyWith<$Res> implements $UserLinksCopyWith<$Res> {
  factory _$UserLinksCopyWith(_UserLinks value, $Res Function(_UserLinks) _then) = __$UserLinksCopyWithImpl;
@override @useResult
$Res call({
 String self, String html, String photos, String likes
});




}
/// @nodoc
class __$UserLinksCopyWithImpl<$Res>
    implements _$UserLinksCopyWith<$Res> {
  __$UserLinksCopyWithImpl(this._self, this._then);

  final _UserLinks _self;
  final $Res Function(_UserLinks) _then;

/// Create a copy of UserLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? self = null,Object? html = null,Object? photos = null,Object? likes = null,}) {
  return _then(_UserLinks(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PhotoUrls {

 String get raw; String get full; String get regular; String get small; String get thumb;
/// Create a copy of PhotoUrls
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoUrlsCopyWith<PhotoUrls> get copyWith => _$PhotoUrlsCopyWithImpl<PhotoUrls>(this as PhotoUrls, _$identity);

  /// Serializes this PhotoUrls to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoUrls&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.full, full) || other.full == full)&&(identical(other.regular, regular) || other.regular == regular)&&(identical(other.small, small) || other.small == small)&&(identical(other.thumb, thumb) || other.thumb == thumb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raw,full,regular,small,thumb);

@override
String toString() {
  return 'PhotoUrls(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb)';
}


}

/// @nodoc
abstract mixin class $PhotoUrlsCopyWith<$Res>  {
  factory $PhotoUrlsCopyWith(PhotoUrls value, $Res Function(PhotoUrls) _then) = _$PhotoUrlsCopyWithImpl;
@useResult
$Res call({
 String raw, String full, String regular, String small, String thumb
});




}
/// @nodoc
class _$PhotoUrlsCopyWithImpl<$Res>
    implements $PhotoUrlsCopyWith<$Res> {
  _$PhotoUrlsCopyWithImpl(this._self, this._then);

  final PhotoUrls _self;
  final $Res Function(PhotoUrls) _then;

/// Create a copy of PhotoUrls
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raw = null,Object? full = null,Object? regular = null,Object? small = null,Object? thumb = null,}) {
  return _then(_self.copyWith(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,full: null == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as String,regular: null == regular ? _self.regular : regular // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PhotoUrls implements PhotoUrls {
   _PhotoUrls({required this.raw, required this.full, required this.regular, required this.small, required this.thumb});
  factory _PhotoUrls.fromJson(Map<String, dynamic> json) => _$PhotoUrlsFromJson(json);

@override final  String raw;
@override final  String full;
@override final  String regular;
@override final  String small;
@override final  String thumb;

/// Create a copy of PhotoUrls
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoUrlsCopyWith<_PhotoUrls> get copyWith => __$PhotoUrlsCopyWithImpl<_PhotoUrls>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoUrlsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoUrls&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.full, full) || other.full == full)&&(identical(other.regular, regular) || other.regular == regular)&&(identical(other.small, small) || other.small == small)&&(identical(other.thumb, thumb) || other.thumb == thumb));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,raw,full,regular,small,thumb);

@override
String toString() {
  return 'PhotoUrls(raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb)';
}


}

/// @nodoc
abstract mixin class _$PhotoUrlsCopyWith<$Res> implements $PhotoUrlsCopyWith<$Res> {
  factory _$PhotoUrlsCopyWith(_PhotoUrls value, $Res Function(_PhotoUrls) _then) = __$PhotoUrlsCopyWithImpl;
@override @useResult
$Res call({
 String raw, String full, String regular, String small, String thumb
});




}
/// @nodoc
class __$PhotoUrlsCopyWithImpl<$Res>
    implements _$PhotoUrlsCopyWith<$Res> {
  __$PhotoUrlsCopyWithImpl(this._self, this._then);

  final _PhotoUrls _self;
  final $Res Function(_PhotoUrls) _then;

/// Create a copy of PhotoUrls
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raw = null,Object? full = null,Object? regular = null,Object? small = null,Object? thumb = null,}) {
  return _then(_PhotoUrls(
raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as String,full: null == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as String,regular: null == regular ? _self.regular : regular // ignore: cast_nullable_to_non_nullable
as String,small: null == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String,thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PhotoLinks {

 String get self; String get html; String get download;
/// Create a copy of PhotoLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoLinksCopyWith<PhotoLinks> get copyWith => _$PhotoLinksCopyWithImpl<PhotoLinks>(this as PhotoLinks, _$identity);

  /// Serializes this PhotoLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoLinks&&(identical(other.self, self) || other.self == self)&&(identical(other.html, html) || other.html == html)&&(identical(other.download, download) || other.download == download));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,html,download);

@override
String toString() {
  return 'PhotoLinks(self: $self, html: $html, download: $download)';
}


}

/// @nodoc
abstract mixin class $PhotoLinksCopyWith<$Res>  {
  factory $PhotoLinksCopyWith(PhotoLinks value, $Res Function(PhotoLinks) _then) = _$PhotoLinksCopyWithImpl;
@useResult
$Res call({
 String self, String html, String download
});




}
/// @nodoc
class _$PhotoLinksCopyWithImpl<$Res>
    implements $PhotoLinksCopyWith<$Res> {
  _$PhotoLinksCopyWithImpl(this._self, this._then);

  final PhotoLinks _self;
  final $Res Function(PhotoLinks) _then;

/// Create a copy of PhotoLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? self = null,Object? html = null,Object? download = null,}) {
  return _then(_self.copyWith(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PhotoLinks implements PhotoLinks {
   _PhotoLinks({required this.self, required this.html, required this.download});
  factory _PhotoLinks.fromJson(Map<String, dynamic> json) => _$PhotoLinksFromJson(json);

@override final  String self;
@override final  String html;
@override final  String download;

/// Create a copy of PhotoLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoLinksCopyWith<_PhotoLinks> get copyWith => __$PhotoLinksCopyWithImpl<_PhotoLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoLinks&&(identical(other.self, self) || other.self == self)&&(identical(other.html, html) || other.html == html)&&(identical(other.download, download) || other.download == download));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,self,html,download);

@override
String toString() {
  return 'PhotoLinks(self: $self, html: $html, download: $download)';
}


}

/// @nodoc
abstract mixin class _$PhotoLinksCopyWith<$Res> implements $PhotoLinksCopyWith<$Res> {
  factory _$PhotoLinksCopyWith(_PhotoLinks value, $Res Function(_PhotoLinks) _then) = __$PhotoLinksCopyWithImpl;
@override @useResult
$Res call({
 String self, String html, String download
});




}
/// @nodoc
class __$PhotoLinksCopyWithImpl<$Res>
    implements _$PhotoLinksCopyWith<$Res> {
  __$PhotoLinksCopyWithImpl(this._self, this._then);

  final _PhotoLinks _self;
  final $Res Function(_PhotoLinks) _then;

/// Create a copy of PhotoLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? self = null,Object? html = null,Object? download = null,}) {
  return _then(_PhotoLinks(
self: null == self ? _self.self : self // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,download: null == download ? _self.download : download // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
