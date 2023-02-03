// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worksites_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorksitesDetailPageState {
  WorksitesModel? get worksites => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  bool get errorFlg => throw _privateConstructorUsedError;
  String get errorState => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorksitesDetailPageStateCopyWith<WorksitesDetailPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorksitesDetailPageStateCopyWith<$Res> {
  factory $WorksitesDetailPageStateCopyWith(WorksitesDetailPageState value,
          $Res Function(WorksitesDetailPageState) then) =
      _$WorksitesDetailPageStateCopyWithImpl<$Res, WorksitesDetailPageState>;
  @useResult
  $Res call(
      {WorksitesModel? worksites,
      int id,
      bool errorFlg,
      String errorState,
      String errorMsg});

  $WorksitesModelCopyWith<$Res>? get worksites;
}

/// @nodoc
class _$WorksitesDetailPageStateCopyWithImpl<$Res,
        $Val extends WorksitesDetailPageState>
    implements $WorksitesDetailPageStateCopyWith<$Res> {
  _$WorksitesDetailPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worksites = freezed,
    Object? id = null,
    Object? errorFlg = null,
    Object? errorState = null,
    Object? errorMsg = null,
  }) {
    return _then(_value.copyWith(
      worksites: freezed == worksites
          ? _value.worksites
          : worksites // ignore: cast_nullable_to_non_nullable
              as WorksitesModel?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorFlg: null == errorFlg
          ? _value.errorFlg
          : errorFlg // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: null == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorksitesModelCopyWith<$Res>? get worksites {
    if (_value.worksites == null) {
      return null;
    }

    return $WorksitesModelCopyWith<$Res>(_value.worksites!, (value) {
      return _then(_value.copyWith(worksites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorksitesDetailPageStateCopyWith<$Res>
    implements $WorksitesDetailPageStateCopyWith<$Res> {
  factory _$$_WorksitesDetailPageStateCopyWith(
          _$_WorksitesDetailPageState value,
          $Res Function(_$_WorksitesDetailPageState) then) =
      __$$_WorksitesDetailPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WorksitesModel? worksites,
      int id,
      bool errorFlg,
      String errorState,
      String errorMsg});

  @override
  $WorksitesModelCopyWith<$Res>? get worksites;
}

/// @nodoc
class __$$_WorksitesDetailPageStateCopyWithImpl<$Res>
    extends _$WorksitesDetailPageStateCopyWithImpl<$Res,
        _$_WorksitesDetailPageState>
    implements _$$_WorksitesDetailPageStateCopyWith<$Res> {
  __$$_WorksitesDetailPageStateCopyWithImpl(_$_WorksitesDetailPageState _value,
      $Res Function(_$_WorksitesDetailPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? worksites = freezed,
    Object? id = null,
    Object? errorFlg = null,
    Object? errorState = null,
    Object? errorMsg = null,
  }) {
    return _then(_$_WorksitesDetailPageState(
      worksites: freezed == worksites
          ? _value.worksites
          : worksites // ignore: cast_nullable_to_non_nullable
              as WorksitesModel?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      errorFlg: null == errorFlg
          ? _value.errorFlg
          : errorFlg // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: null == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WorksitesDetailPageState extends _WorksitesDetailPageState {
  const _$_WorksitesDetailPageState(
      {this.worksites,
      this.id = 0,
      this.errorFlg = false,
      this.errorState = '',
      this.errorMsg = ''})
      : super._();

  @override
  final WorksitesModel? worksites;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final bool errorFlg;
  @override
  @JsonKey()
  final String errorState;
  @override
  @JsonKey()
  final String errorMsg;

  @override
  String toString() {
    return 'WorksitesDetailPageState(worksites: $worksites, id: $id, errorFlg: $errorFlg, errorState: $errorState, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorksitesDetailPageState &&
            (identical(other.worksites, worksites) ||
                other.worksites == worksites) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.errorFlg, errorFlg) ||
                other.errorFlg == errorFlg) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, worksites, id, errorFlg, errorState, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorksitesDetailPageStateCopyWith<_$_WorksitesDetailPageState>
      get copyWith => __$$_WorksitesDetailPageStateCopyWithImpl<
          _$_WorksitesDetailPageState>(this, _$identity);
}

abstract class _WorksitesDetailPageState extends WorksitesDetailPageState {
  const factory _WorksitesDetailPageState(
      {final WorksitesModel? worksites,
      final int id,
      final bool errorFlg,
      final String errorState,
      final String errorMsg}) = _$_WorksitesDetailPageState;
  const _WorksitesDetailPageState._() : super._();

  @override
  WorksitesModel? get worksites;
  @override
  int get id;
  @override
  bool get errorFlg;
  @override
  String get errorState;
  @override
  String get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$_WorksitesDetailPageStateCopyWith<_$_WorksitesDetailPageState>
      get copyWith => throw _privateConstructorUsedError;
}
