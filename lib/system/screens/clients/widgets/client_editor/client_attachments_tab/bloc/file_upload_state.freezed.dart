// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileUploadState {
// PDF Section
  Status get pdfStatus => throw _privateConstructorUsedError;
  List<UploadedFile> get pdfFiles => throw _privateConstructorUsedError;
  String? get pdfError => throw _privateConstructorUsedError; // TXT Section
  Status get txtStatus => throw _privateConstructorUsedError;
  List<UploadedFile> get txtFiles => throw _privateConstructorUsedError;
  String? get txtError => throw _privateConstructorUsedError; // Image Section
  Status get imageStatus => throw _privateConstructorUsedError;
  List<UploadedFile> get imageFiles => throw _privateConstructorUsedError;
  String? get imageError => throw _privateConstructorUsedError; // Video Section
  Status get videoStatus => throw _privateConstructorUsedError;
  List<UploadedFile> get videoFiles => throw _privateConstructorUsedError;
  String? get videoError =>
      throw _privateConstructorUsedError; // UI states for drag-drop
  bool get isDragOver => throw _privateConstructorUsedError;
  String? get currentDragSection => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadStateCopyWith<FileUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadStateCopyWith<$Res> {
  factory $FileUploadStateCopyWith(
          FileUploadState value, $Res Function(FileUploadState) then) =
      _$FileUploadStateCopyWithImpl<$Res, FileUploadState>;
  @useResult
  $Res call(
      {Status pdfStatus,
      List<UploadedFile> pdfFiles,
      String? pdfError,
      Status txtStatus,
      List<UploadedFile> txtFiles,
      String? txtError,
      Status imageStatus,
      List<UploadedFile> imageFiles,
      String? imageError,
      Status videoStatus,
      List<UploadedFile> videoFiles,
      String? videoError,
      bool isDragOver,
      String? currentDragSection});
}

/// @nodoc
class _$FileUploadStateCopyWithImpl<$Res, $Val extends FileUploadState>
    implements $FileUploadStateCopyWith<$Res> {
  _$FileUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfStatus = null,
    Object? pdfFiles = null,
    Object? pdfError = freezed,
    Object? txtStatus = null,
    Object? txtFiles = null,
    Object? txtError = freezed,
    Object? imageStatus = null,
    Object? imageFiles = null,
    Object? imageError = freezed,
    Object? videoStatus = null,
    Object? videoFiles = null,
    Object? videoError = freezed,
    Object? isDragOver = null,
    Object? currentDragSection = freezed,
  }) {
    return _then(_value.copyWith(
      pdfStatus: null == pdfStatus
          ? _value.pdfStatus
          : pdfStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pdfFiles: null == pdfFiles
          ? _value.pdfFiles
          : pdfFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      pdfError: freezed == pdfError
          ? _value.pdfError
          : pdfError // ignore: cast_nullable_to_non_nullable
              as String?,
      txtStatus: null == txtStatus
          ? _value.txtStatus
          : txtStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      txtFiles: null == txtFiles
          ? _value.txtFiles
          : txtFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      txtError: freezed == txtError
          ? _value.txtError
          : txtError // ignore: cast_nullable_to_non_nullable
              as String?,
      imageStatus: null == imageStatus
          ? _value.imageStatus
          : imageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      imageFiles: null == imageFiles
          ? _value.imageFiles
          : imageFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      imageError: freezed == imageError
          ? _value.imageError
          : imageError // ignore: cast_nullable_to_non_nullable
              as String?,
      videoStatus: null == videoStatus
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      videoFiles: null == videoFiles
          ? _value.videoFiles
          : videoFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      videoError: freezed == videoError
          ? _value.videoError
          : videoError // ignore: cast_nullable_to_non_nullable
              as String?,
      isDragOver: null == isDragOver
          ? _value.isDragOver
          : isDragOver // ignore: cast_nullable_to_non_nullable
              as bool,
      currentDragSection: freezed == currentDragSection
          ? _value.currentDragSection
          : currentDragSection // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileUploadStateImplCopyWith<$Res>
    implements $FileUploadStateCopyWith<$Res> {
  factory _$$FileUploadStateImplCopyWith(_$FileUploadStateImpl value,
          $Res Function(_$FileUploadStateImpl) then) =
      __$$FileUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status pdfStatus,
      List<UploadedFile> pdfFiles,
      String? pdfError,
      Status txtStatus,
      List<UploadedFile> txtFiles,
      String? txtError,
      Status imageStatus,
      List<UploadedFile> imageFiles,
      String? imageError,
      Status videoStatus,
      List<UploadedFile> videoFiles,
      String? videoError,
      bool isDragOver,
      String? currentDragSection});
}

/// @nodoc
class __$$FileUploadStateImplCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$FileUploadStateImpl>
    implements _$$FileUploadStateImplCopyWith<$Res> {
  __$$FileUploadStateImplCopyWithImpl(
      _$FileUploadStateImpl _value, $Res Function(_$FileUploadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfStatus = null,
    Object? pdfFiles = null,
    Object? pdfError = freezed,
    Object? txtStatus = null,
    Object? txtFiles = null,
    Object? txtError = freezed,
    Object? imageStatus = null,
    Object? imageFiles = null,
    Object? imageError = freezed,
    Object? videoStatus = null,
    Object? videoFiles = null,
    Object? videoError = freezed,
    Object? isDragOver = null,
    Object? currentDragSection = freezed,
  }) {
    return _then(_$FileUploadStateImpl(
      pdfStatus: null == pdfStatus
          ? _value.pdfStatus
          : pdfStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      pdfFiles: null == pdfFiles
          ? _value._pdfFiles
          : pdfFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      pdfError: freezed == pdfError
          ? _value.pdfError
          : pdfError // ignore: cast_nullable_to_non_nullable
              as String?,
      txtStatus: null == txtStatus
          ? _value.txtStatus
          : txtStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      txtFiles: null == txtFiles
          ? _value._txtFiles
          : txtFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      txtError: freezed == txtError
          ? _value.txtError
          : txtError // ignore: cast_nullable_to_non_nullable
              as String?,
      imageStatus: null == imageStatus
          ? _value.imageStatus
          : imageStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      imageFiles: null == imageFiles
          ? _value._imageFiles
          : imageFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      imageError: freezed == imageError
          ? _value.imageError
          : imageError // ignore: cast_nullable_to_non_nullable
              as String?,
      videoStatus: null == videoStatus
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      videoFiles: null == videoFiles
          ? _value._videoFiles
          : videoFiles // ignore: cast_nullable_to_non_nullable
              as List<UploadedFile>,
      videoError: freezed == videoError
          ? _value.videoError
          : videoError // ignore: cast_nullable_to_non_nullable
              as String?,
      isDragOver: null == isDragOver
          ? _value.isDragOver
          : isDragOver // ignore: cast_nullable_to_non_nullable
              as bool,
      currentDragSection: freezed == currentDragSection
          ? _value.currentDragSection
          : currentDragSection // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FileUploadStateImpl implements _FileUploadState {
  const _$FileUploadStateImpl(
      {this.pdfStatus = Status.initial,
      final List<UploadedFile> pdfFiles = const [],
      this.pdfError,
      this.txtStatus = Status.initial,
      final List<UploadedFile> txtFiles = const [],
      this.txtError,
      this.imageStatus = Status.initial,
      final List<UploadedFile> imageFiles = const [],
      this.imageError,
      this.videoStatus = Status.initial,
      final List<UploadedFile> videoFiles = const [],
      this.videoError,
      this.isDragOver = false,
      this.currentDragSection})
      : _pdfFiles = pdfFiles,
        _txtFiles = txtFiles,
        _imageFiles = imageFiles,
        _videoFiles = videoFiles;

// PDF Section
  @override
  @JsonKey()
  final Status pdfStatus;
  final List<UploadedFile> _pdfFiles;
  @override
  @JsonKey()
  List<UploadedFile> get pdfFiles {
    if (_pdfFiles is EqualUnmodifiableListView) return _pdfFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdfFiles);
  }

  @override
  final String? pdfError;
// TXT Section
  @override
  @JsonKey()
  final Status txtStatus;
  final List<UploadedFile> _txtFiles;
  @override
  @JsonKey()
  List<UploadedFile> get txtFiles {
    if (_txtFiles is EqualUnmodifiableListView) return _txtFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_txtFiles);
  }

  @override
  final String? txtError;
// Image Section
  @override
  @JsonKey()
  final Status imageStatus;
  final List<UploadedFile> _imageFiles;
  @override
  @JsonKey()
  List<UploadedFile> get imageFiles {
    if (_imageFiles is EqualUnmodifiableListView) return _imageFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFiles);
  }

  @override
  final String? imageError;
// Video Section
  @override
  @JsonKey()
  final Status videoStatus;
  final List<UploadedFile> _videoFiles;
  @override
  @JsonKey()
  List<UploadedFile> get videoFiles {
    if (_videoFiles is EqualUnmodifiableListView) return _videoFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoFiles);
  }

  @override
  final String? videoError;
// UI states for drag-drop
  @override
  @JsonKey()
  final bool isDragOver;
  @override
  final String? currentDragSection;

  @override
  String toString() {
    return 'FileUploadState(pdfStatus: $pdfStatus, pdfFiles: $pdfFiles, pdfError: $pdfError, txtStatus: $txtStatus, txtFiles: $txtFiles, txtError: $txtError, imageStatus: $imageStatus, imageFiles: $imageFiles, imageError: $imageError, videoStatus: $videoStatus, videoFiles: $videoFiles, videoError: $videoError, isDragOver: $isDragOver, currentDragSection: $currentDragSection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadStateImpl &&
            (identical(other.pdfStatus, pdfStatus) ||
                other.pdfStatus == pdfStatus) &&
            const DeepCollectionEquality().equals(other._pdfFiles, _pdfFiles) &&
            (identical(other.pdfError, pdfError) ||
                other.pdfError == pdfError) &&
            (identical(other.txtStatus, txtStatus) ||
                other.txtStatus == txtStatus) &&
            const DeepCollectionEquality().equals(other._txtFiles, _txtFiles) &&
            (identical(other.txtError, txtError) ||
                other.txtError == txtError) &&
            (identical(other.imageStatus, imageStatus) ||
                other.imageStatus == imageStatus) &&
            const DeepCollectionEquality()
                .equals(other._imageFiles, _imageFiles) &&
            (identical(other.imageError, imageError) ||
                other.imageError == imageError) &&
            (identical(other.videoStatus, videoStatus) ||
                other.videoStatus == videoStatus) &&
            const DeepCollectionEquality()
                .equals(other._videoFiles, _videoFiles) &&
            (identical(other.videoError, videoError) ||
                other.videoError == videoError) &&
            (identical(other.isDragOver, isDragOver) ||
                other.isDragOver == isDragOver) &&
            (identical(other.currentDragSection, currentDragSection) ||
                other.currentDragSection == currentDragSection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pdfStatus,
      const DeepCollectionEquality().hash(_pdfFiles),
      pdfError,
      txtStatus,
      const DeepCollectionEquality().hash(_txtFiles),
      txtError,
      imageStatus,
      const DeepCollectionEquality().hash(_imageFiles),
      imageError,
      videoStatus,
      const DeepCollectionEquality().hash(_videoFiles),
      videoError,
      isDragOver,
      currentDragSection);

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadStateImplCopyWith<_$FileUploadStateImpl> get copyWith =>
      __$$FileUploadStateImplCopyWithImpl<_$FileUploadStateImpl>(
          this, _$identity);
}

abstract class _FileUploadState implements FileUploadState {
  const factory _FileUploadState(
      {final Status pdfStatus,
      final List<UploadedFile> pdfFiles,
      final String? pdfError,
      final Status txtStatus,
      final List<UploadedFile> txtFiles,
      final String? txtError,
      final Status imageStatus,
      final List<UploadedFile> imageFiles,
      final String? imageError,
      final Status videoStatus,
      final List<UploadedFile> videoFiles,
      final String? videoError,
      final bool isDragOver,
      final String? currentDragSection}) = _$FileUploadStateImpl;

// PDF Section
  @override
  Status get pdfStatus;
  @override
  List<UploadedFile> get pdfFiles;
  @override
  String? get pdfError; // TXT Section
  @override
  Status get txtStatus;
  @override
  List<UploadedFile> get txtFiles;
  @override
  String? get txtError; // Image Section
  @override
  Status get imageStatus;
  @override
  List<UploadedFile> get imageFiles;
  @override
  String? get imageError; // Video Section
  @override
  Status get videoStatus;
  @override
  List<UploadedFile> get videoFiles;
  @override
  String? get videoError; // UI states for drag-drop
  @override
  bool get isDragOver;
  @override
  String? get currentDragSection;

  /// Create a copy of FileUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadStateImplCopyWith<_$FileUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
