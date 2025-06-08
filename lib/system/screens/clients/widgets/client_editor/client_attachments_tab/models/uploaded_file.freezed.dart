// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploaded_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) {
  return _UploadedFile.fromJson(json);
}

/// @nodoc
mixin _$UploadedFile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get mimeType => throw _privateConstructorUsedError;
  DateTime get lastModified => throw _privateConstructorUsedError;
  String get fileExtension => throw _privateConstructorUsedError;
  FileType get fileType => throw _privateConstructorUsedError;
  String? get tempUrl => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  DropzoneFileInterface? get fileInterface =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  picker.PlatformFile? get platformFile => throw _privateConstructorUsedError;

  /// Serializes this UploadedFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadedFileCopyWith<UploadedFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedFileCopyWith<$Res> {
  factory $UploadedFileCopyWith(
          UploadedFile value, $Res Function(UploadedFile) then) =
      _$UploadedFileCopyWithImpl<$Res, UploadedFile>;
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String mimeType,
      DateTime lastModified,
      String fileExtension,
      FileType fileType,
      String? tempUrl,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DropzoneFileInterface? fileInterface,
      @JsonKey(includeFromJson: false, includeToJson: false)
      picker.PlatformFile? platformFile});
}

/// @nodoc
class _$UploadedFileCopyWithImpl<$Res, $Val extends UploadedFile>
    implements $UploadedFileCopyWith<$Res> {
  _$UploadedFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? lastModified = null,
    Object? fileExtension = null,
    Object? fileType = null,
    Object? tempUrl = freezed,
    Object? fileInterface = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileExtension: null == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      tempUrl: freezed == tempUrl
          ? _value.tempUrl
          : tempUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileInterface: freezed == fileInterface
          ? _value.fileInterface
          : fileInterface // ignore: cast_nullable_to_non_nullable
              as DropzoneFileInterface?,
      platformFile: freezed == platformFile
          ? _value.platformFile
          : platformFile // ignore: cast_nullable_to_non_nullable
              as picker.PlatformFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedFileImplCopyWith<$Res>
    implements $UploadedFileCopyWith<$Res> {
  factory _$$UploadedFileImplCopyWith(
          _$UploadedFileImpl value, $Res Function(_$UploadedFileImpl) then) =
      __$$UploadedFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int size,
      String mimeType,
      DateTime lastModified,
      String fileExtension,
      FileType fileType,
      String? tempUrl,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DropzoneFileInterface? fileInterface,
      @JsonKey(includeFromJson: false, includeToJson: false)
      picker.PlatformFile? platformFile});
}

/// @nodoc
class __$$UploadedFileImplCopyWithImpl<$Res>
    extends _$UploadedFileCopyWithImpl<$Res, _$UploadedFileImpl>
    implements _$$UploadedFileImplCopyWith<$Res> {
  __$$UploadedFileImplCopyWithImpl(
      _$UploadedFileImpl _value, $Res Function(_$UploadedFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? size = null,
    Object? mimeType = null,
    Object? lastModified = null,
    Object? fileExtension = null,
    Object? fileType = null,
    Object? tempUrl = freezed,
    Object? fileInterface = freezed,
    Object? platformFile = freezed,
  }) {
    return _then(_$UploadedFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileExtension: null == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      tempUrl: freezed == tempUrl
          ? _value.tempUrl
          : tempUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileInterface: freezed == fileInterface
          ? _value.fileInterface
          : fileInterface // ignore: cast_nullable_to_non_nullable
              as DropzoneFileInterface?,
      platformFile: freezed == platformFile
          ? _value.platformFile
          : platformFile // ignore: cast_nullable_to_non_nullable
              as picker.PlatformFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedFileImpl implements _UploadedFile {
  const _$UploadedFileImpl(
      {required this.id,
      required this.name,
      required this.size,
      required this.mimeType,
      required this.lastModified,
      required this.fileExtension,
      required this.fileType,
      this.tempUrl,
      @JsonKey(includeFromJson: false, includeToJson: false) this.fileInterface,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.platformFile});

  factory _$UploadedFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedFileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int size;
  @override
  final String mimeType;
  @override
  final DateTime lastModified;
  @override
  final String fileExtension;
  @override
  final FileType fileType;
  @override
  final String? tempUrl;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DropzoneFileInterface? fileInterface;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final picker.PlatformFile? platformFile;

  @override
  String toString() {
    return 'UploadedFile(id: $id, name: $name, size: $size, mimeType: $mimeType, lastModified: $lastModified, fileExtension: $fileExtension, fileType: $fileType, tempUrl: $tempUrl, fileInterface: $fileInterface, platformFile: $platformFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.tempUrl, tempUrl) || other.tempUrl == tempUrl) &&
            (identical(other.fileInterface, fileInterface) ||
                other.fileInterface == fileInterface) &&
            (identical(other.platformFile, platformFile) ||
                other.platformFile == platformFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      size,
      mimeType,
      lastModified,
      fileExtension,
      fileType,
      tempUrl,
      fileInterface,
      platformFile);

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      __$$UploadedFileImplCopyWithImpl<_$UploadedFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedFileImplToJson(
      this,
    );
  }
}

abstract class _UploadedFile implements UploadedFile {
  const factory _UploadedFile(
      {required final String id,
      required final String name,
      required final int size,
      required final String mimeType,
      required final DateTime lastModified,
      required final String fileExtension,
      required final FileType fileType,
      final String? tempUrl,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final DropzoneFileInterface? fileInterface,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final picker.PlatformFile? platformFile}) = _$UploadedFileImpl;

  factory _UploadedFile.fromJson(Map<String, dynamic> json) =
      _$UploadedFileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get size;
  @override
  String get mimeType;
  @override
  DateTime get lastModified;
  @override
  String get fileExtension;
  @override
  FileType get fileType;
  @override
  String? get tempUrl;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DropzoneFileInterface? get fileInterface;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  picker.PlatformFile? get platformFile;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileValidationError _$FileValidationErrorFromJson(Map<String, dynamic> json) {
  return _FileValidationError.fromJson(json);
}

/// @nodoc
mixin _$FileValidationError {
  String get message => throw _privateConstructorUsedError;
  FileValidationErrorType get type => throw _privateConstructorUsedError;

  /// Serializes this FileValidationError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileValidationErrorCopyWith<FileValidationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileValidationErrorCopyWith<$Res> {
  factory $FileValidationErrorCopyWith(
          FileValidationError value, $Res Function(FileValidationError) then) =
      _$FileValidationErrorCopyWithImpl<$Res, FileValidationError>;
  @useResult
  $Res call({String message, FileValidationErrorType type});
}

/// @nodoc
class _$FileValidationErrorCopyWithImpl<$Res, $Val extends FileValidationError>
    implements $FileValidationErrorCopyWith<$Res> {
  _$FileValidationErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileValidationErrorType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileValidationErrorImplCopyWith<$Res>
    implements $FileValidationErrorCopyWith<$Res> {
  factory _$$FileValidationErrorImplCopyWith(_$FileValidationErrorImpl value,
          $Res Function(_$FileValidationErrorImpl) then) =
      __$$FileValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, FileValidationErrorType type});
}

/// @nodoc
class __$$FileValidationErrorImplCopyWithImpl<$Res>
    extends _$FileValidationErrorCopyWithImpl<$Res, _$FileValidationErrorImpl>
    implements _$$FileValidationErrorImplCopyWith<$Res> {
  __$$FileValidationErrorImplCopyWithImpl(_$FileValidationErrorImpl _value,
      $Res Function(_$FileValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileValidationError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
  }) {
    return _then(_$FileValidationErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FileValidationErrorType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileValidationErrorImpl implements _FileValidationError {
  const _$FileValidationErrorImpl({required this.message, required this.type});

  factory _$FileValidationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileValidationErrorImplFromJson(json);

  @override
  final String message;
  @override
  final FileValidationErrorType type;

  @override
  String toString() {
    return 'FileValidationError(message: $message, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileValidationErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, type);

  /// Create a copy of FileValidationError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileValidationErrorImplCopyWith<_$FileValidationErrorImpl> get copyWith =>
      __$$FileValidationErrorImplCopyWithImpl<_$FileValidationErrorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileValidationErrorImplToJson(
      this,
    );
  }
}

abstract class _FileValidationError implements FileValidationError {
  const factory _FileValidationError(
      {required final String message,
      required final FileValidationErrorType type}) = _$FileValidationErrorImpl;

  factory _FileValidationError.fromJson(Map<String, dynamic> json) =
      _$FileValidationErrorImpl.fromJson;

  @override
  String get message;
  @override
  FileValidationErrorType get type;

  /// Create a copy of FileValidationError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileValidationErrorImplCopyWith<_$FileValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileUploadConfig _$FileUploadConfigFromJson(Map<String, dynamic> json) {
  return _FileUploadConfig.fromJson(json);
}

/// @nodoc
mixin _$FileUploadConfig {
  FileType get fileType => throw _privateConstructorUsedError;
  int get maxFileSize => throw _privateConstructorUsedError;
  List<String> get allowedExtensions => throw _privateConstructorUsedError;

  /// Serializes this FileUploadConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadConfigCopyWith<FileUploadConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadConfigCopyWith<$Res> {
  factory $FileUploadConfigCopyWith(
          FileUploadConfig value, $Res Function(FileUploadConfig) then) =
      _$FileUploadConfigCopyWithImpl<$Res, FileUploadConfig>;
  @useResult
  $Res call(
      {FileType fileType, int maxFileSize, List<String> allowedExtensions});
}

/// @nodoc
class _$FileUploadConfigCopyWithImpl<$Res, $Val extends FileUploadConfig>
    implements $FileUploadConfigCopyWith<$Res> {
  _$FileUploadConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileType = null,
    Object? maxFileSize = null,
    Object? allowedExtensions = null,
  }) {
    return _then(_value.copyWith(
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      maxFileSize: null == maxFileSize
          ? _value.maxFileSize
          : maxFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      allowedExtensions: null == allowedExtensions
          ? _value.allowedExtensions
          : allowedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileUploadConfigImplCopyWith<$Res>
    implements $FileUploadConfigCopyWith<$Res> {
  factory _$$FileUploadConfigImplCopyWith(_$FileUploadConfigImpl value,
          $Res Function(_$FileUploadConfigImpl) then) =
      __$$FileUploadConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FileType fileType, int maxFileSize, List<String> allowedExtensions});
}

/// @nodoc
class __$$FileUploadConfigImplCopyWithImpl<$Res>
    extends _$FileUploadConfigCopyWithImpl<$Res, _$FileUploadConfigImpl>
    implements _$$FileUploadConfigImplCopyWith<$Res> {
  __$$FileUploadConfigImplCopyWithImpl(_$FileUploadConfigImpl _value,
      $Res Function(_$FileUploadConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of FileUploadConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileType = null,
    Object? maxFileSize = null,
    Object? allowedExtensions = null,
  }) {
    return _then(_$FileUploadConfigImpl(
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      maxFileSize: null == maxFileSize
          ? _value.maxFileSize
          : maxFileSize // ignore: cast_nullable_to_non_nullable
              as int,
      allowedExtensions: null == allowedExtensions
          ? _value._allowedExtensions
          : allowedExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileUploadConfigImpl implements _FileUploadConfig {
  const _$FileUploadConfigImpl(
      {required this.fileType,
      required this.maxFileSize,
      required final List<String> allowedExtensions})
      : _allowedExtensions = allowedExtensions;

  factory _$FileUploadConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadConfigImplFromJson(json);

  @override
  final FileType fileType;
  @override
  final int maxFileSize;
  final List<String> _allowedExtensions;
  @override
  List<String> get allowedExtensions {
    if (_allowedExtensions is EqualUnmodifiableListView)
      return _allowedExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedExtensions);
  }

  @override
  String toString() {
    return 'FileUploadConfig(fileType: $fileType, maxFileSize: $maxFileSize, allowedExtensions: $allowedExtensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadConfigImpl &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.maxFileSize, maxFileSize) ||
                other.maxFileSize == maxFileSize) &&
            const DeepCollectionEquality()
                .equals(other._allowedExtensions, _allowedExtensions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileType, maxFileSize,
      const DeepCollectionEquality().hash(_allowedExtensions));

  /// Create a copy of FileUploadConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadConfigImplCopyWith<_$FileUploadConfigImpl> get copyWith =>
      __$$FileUploadConfigImplCopyWithImpl<_$FileUploadConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadConfigImplToJson(
      this,
    );
  }
}

abstract class _FileUploadConfig implements FileUploadConfig {
  const factory _FileUploadConfig(
      {required final FileType fileType,
      required final int maxFileSize,
      required final List<String> allowedExtensions}) = _$FileUploadConfigImpl;

  factory _FileUploadConfig.fromJson(Map<String, dynamic> json) =
      _$FileUploadConfigImpl.fromJson;

  @override
  FileType get fileType;
  @override
  int get maxFileSize;
  @override
  List<String> get allowedExtensions;

  /// Create a copy of FileUploadConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadConfigImplCopyWith<_$FileUploadConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
