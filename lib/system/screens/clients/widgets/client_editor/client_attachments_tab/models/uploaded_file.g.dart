// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadedFileImpl _$$UploadedFileImplFromJson(Map<String, dynamic> json) =>
    _$UploadedFileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      mimeType: json['mimeType'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      fileExtension: json['fileExtension'] as String,
      fileType: $enumDecode(_$FileTypeEnumMap, json['fileType']),
      tempUrl: json['tempUrl'] as String?,
    );

Map<String, dynamic> _$$UploadedFileImplToJson(_$UploadedFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'size': instance.size,
      'mimeType': instance.mimeType,
      'lastModified': instance.lastModified.toIso8601String(),
      'fileExtension': instance.fileExtension,
      'fileType': _$FileTypeEnumMap[instance.fileType]!,
      'tempUrl': instance.tempUrl,
    };

const _$FileTypeEnumMap = {
  FileType.pdf: 'pdf',
  FileType.txt: 'txt',
  FileType.image: 'image',
  FileType.video: 'video',
};

_$FileValidationErrorImpl _$$FileValidationErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$FileValidationErrorImpl(
      message: json['message'] as String,
      type: $enumDecode(_$FileValidationErrorTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$FileValidationErrorImplToJson(
        _$FileValidationErrorImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$FileValidationErrorTypeEnumMap[instance.type]!,
    };

const _$FileValidationErrorTypeEnumMap = {
  FileValidationErrorType.fileTooLarge: 'fileTooLarge',
  FileValidationErrorType.invalidFileType: 'invalidFileType',
  FileValidationErrorType.invalidExtension: 'invalidExtension',
  FileValidationErrorType.sectionMismatch: 'sectionMismatch',
  FileValidationErrorType.uploadFailed: 'uploadFailed',
  FileValidationErrorType.unknown: 'unknown',
};

_$FileUploadConfigImpl _$$FileUploadConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadConfigImpl(
      fileType: $enumDecode(_$FileTypeEnumMap, json['fileType']),
      maxFileSize: (json['maxFileSize'] as num).toInt(),
      allowedExtensions: (json['allowedExtensions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FileUploadConfigImplToJson(
        _$FileUploadConfigImpl instance) =>
    <String, dynamic>{
      'fileType': _$FileTypeEnumMap[instance.fileType]!,
      'maxFileSize': instance.maxFileSize,
      'allowedExtensions': instance.allowedExtensions,
    };
