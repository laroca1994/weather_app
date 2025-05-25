// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState()';
}


}

/// @nodoc
class $WeatherStateCopyWith<$Res>  {
$WeatherStateCopyWith(WeatherState _, $Res Function(WeatherState) __);
}


/// @nodoc


class WeatherInitial implements WeatherState {
  const WeatherInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.initial()';
}


}




/// @nodoc


class WeatherLoading implements WeatherState {
  const WeatherLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherState.loading()';
}


}




/// @nodoc


class WeatherLoaded implements WeatherState {
  const WeatherLoaded({required this.weather, final  List<WeatherEntity>? history}): _history = history;
  

 final  WeatherEntity weather;
 final  List<WeatherEntity>? _history;
 List<WeatherEntity>? get history {
  final value = _history;
  if (value == null) return null;
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLoadedCopyWith<WeatherLoaded> get copyWith => _$WeatherLoadedCopyWithImpl<WeatherLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoaded&&(identical(other.weather, weather) || other.weather == weather)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,weather,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'WeatherState.loaded(weather: $weather, history: $history)';
}


}

/// @nodoc
abstract mixin class $WeatherLoadedCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherLoadedCopyWith(WeatherLoaded value, $Res Function(WeatherLoaded) _then) = _$WeatherLoadedCopyWithImpl;
@useResult
$Res call({
 WeatherEntity weather, List<WeatherEntity>? history
});


$WeatherEntityCopyWith<$Res> get weather;

}
/// @nodoc
class _$WeatherLoadedCopyWithImpl<$Res>
    implements $WeatherLoadedCopyWith<$Res> {
  _$WeatherLoadedCopyWithImpl(this._self, this._then);

  final WeatherLoaded _self;
  final $Res Function(WeatherLoaded) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weather = null,Object? history = freezed,}) {
  return _then(WeatherLoaded(
weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherEntity,history: freezed == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<WeatherEntity>?,
  ));
}

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherEntityCopyWith<$Res> get weather {
  
  return $WeatherEntityCopyWith<$Res>(_self.weather, (value) {
    return _then(_self.copyWith(weather: value));
  });
}
}

/// @nodoc


class WeatherError implements WeatherState {
  const WeatherError(this.message);
  

 final  String message;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherErrorCopyWith<WeatherError> get copyWith => _$WeatherErrorCopyWithImpl<WeatherError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WeatherState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WeatherErrorCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory $WeatherErrorCopyWith(WeatherError value, $Res Function(WeatherError) _then) = _$WeatherErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WeatherErrorCopyWithImpl<$Res>
    implements $WeatherErrorCopyWith<$Res> {
  _$WeatherErrorCopyWithImpl(this._self, this._then);

  final WeatherError _self;
  final $Res Function(WeatherError) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WeatherError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SavedSearchesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedSearchesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedSearchesState()';
}


}

/// @nodoc
class $SavedSearchesStateCopyWith<$Res>  {
$SavedSearchesStateCopyWith(SavedSearchesState _, $Res Function(SavedSearchesState) __);
}


/// @nodoc


class SavedSearchesInitial implements SavedSearchesState {
  const SavedSearchesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedSearchesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedSearchesState.initial()';
}


}




/// @nodoc


class SavedSearchesLoading implements SavedSearchesState {
  const SavedSearchesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedSearchesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SavedSearchesState.loading()';
}


}




/// @nodoc


class SavedSearchesLoaded implements SavedSearchesState {
  const SavedSearchesLoaded({required final  List<WeatherEntity> searches}): _searches = searches;
  

 final  List<WeatherEntity> _searches;
 List<WeatherEntity> get searches {
  if (_searches is EqualUnmodifiableListView) return _searches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searches);
}


/// Create a copy of SavedSearchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedSearchesLoadedCopyWith<SavedSearchesLoaded> get copyWith => _$SavedSearchesLoadedCopyWithImpl<SavedSearchesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedSearchesLoaded&&const DeepCollectionEquality().equals(other._searches, _searches));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searches));

@override
String toString() {
  return 'SavedSearchesState.loaded(searches: $searches)';
}


}

/// @nodoc
abstract mixin class $SavedSearchesLoadedCopyWith<$Res> implements $SavedSearchesStateCopyWith<$Res> {
  factory $SavedSearchesLoadedCopyWith(SavedSearchesLoaded value, $Res Function(SavedSearchesLoaded) _then) = _$SavedSearchesLoadedCopyWithImpl;
@useResult
$Res call({
 List<WeatherEntity> searches
});




}
/// @nodoc
class _$SavedSearchesLoadedCopyWithImpl<$Res>
    implements $SavedSearchesLoadedCopyWith<$Res> {
  _$SavedSearchesLoadedCopyWithImpl(this._self, this._then);

  final SavedSearchesLoaded _self;
  final $Res Function(SavedSearchesLoaded) _then;

/// Create a copy of SavedSearchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searches = null,}) {
  return _then(SavedSearchesLoaded(
searches: null == searches ? _self._searches : searches // ignore: cast_nullable_to_non_nullable
as List<WeatherEntity>,
  ));
}


}

/// @nodoc


class SavedSearchesError implements SavedSearchesState {
  const SavedSearchesError(this.message);
  

 final  String message;

/// Create a copy of SavedSearchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedSearchesErrorCopyWith<SavedSearchesError> get copyWith => _$SavedSearchesErrorCopyWithImpl<SavedSearchesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedSearchesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SavedSearchesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SavedSearchesErrorCopyWith<$Res> implements $SavedSearchesStateCopyWith<$Res> {
  factory $SavedSearchesErrorCopyWith(SavedSearchesError value, $Res Function(SavedSearchesError) _then) = _$SavedSearchesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SavedSearchesErrorCopyWithImpl<$Res>
    implements $SavedSearchesErrorCopyWith<$Res> {
  _$SavedSearchesErrorCopyWithImpl(this._self, this._then);

  final SavedSearchesError _self;
  final $Res Function(SavedSearchesError) _then;

/// Create a copy of SavedSearchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SavedSearchesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
