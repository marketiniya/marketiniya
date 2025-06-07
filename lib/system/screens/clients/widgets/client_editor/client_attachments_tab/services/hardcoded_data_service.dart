import 'package:injectable/injectable.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/enums/file_type.dart';
import 'package:marketinya/system/screens/clients/widgets/client_editor/client_attachments_tab/models/uploaded_file.dart';

@Injectable()
class HardcodedDataService {
  /// Simulate loading PDF files
  Future<List<UploadedFile>> getPdfFiles() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    return [
      UploadedFile(
        id: 'pdf_1',
        name: 'contract.pdf',
        size: 2048576, // 2MB
        mimeType: 'application/pdf',
        lastModified: DateTime.now().subtract(const Duration(days: 1)),
        fileExtension: 'pdf',
        sectionType: FileType.pdf,
      ),
      UploadedFile(
        id: 'pdf_2',
        name: 'invoice_2024.pdf',
        size: 1536000, // 1.5MB
        mimeType: 'application/pdf',
        lastModified: DateTime.now().subtract(const Duration(hours: 3)),
        fileExtension: 'pdf',
        sectionType: FileType.pdf,
      ),
      UploadedFile(
        id: 'pdf_3',
        name: 'business_plan.pdf',
        size: 5242880, // 5MB
        mimeType: 'application/pdf',
        lastModified: DateTime.now().subtract(const Duration(days: 7)),
        fileExtension: 'pdf',
        sectionType: FileType.pdf,
      ),
    ];
  }

  /// Simulate loading TXT files
  Future<List<UploadedFile>> getTxtFiles() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      UploadedFile(
        id: 'txt_1',
        name: 'notes.txt',
        size: 15360, // 15KB
        mimeType: 'text/plain',
        lastModified: DateTime.now().subtract(const Duration(hours: 2)),
        fileExtension: 'txt',
        sectionType: FileType.txt,
      ),
      UploadedFile(
        id: 'txt_2',
        name: 'requirements.docx',
        size: 204800, // 200KB
        mimeType: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        lastModified: DateTime.now().subtract(const Duration(days: 2)),
        fileExtension: 'docx',
        sectionType: FileType.txt,
      ),
    ];
  }

  /// Simulate loading Image files
  Future<List<UploadedFile>> getImageFiles() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1200));
    
    return [
      UploadedFile(
        id: 'img_1',
        name: 'logo.png',
        size: 512000, // 500KB
        mimeType: 'image/png',
        lastModified: DateTime.now().subtract(const Duration(hours: 5)),
        fileExtension: 'png',
        sectionType: FileType.image,
      ),
      UploadedFile(
        id: 'img_2',
        name: 'banner.jpg',
        size: 1048576, // 1MB
        mimeType: 'image/jpeg',
        lastModified: DateTime.now().subtract(const Duration(days: 1)),
        fileExtension: 'jpg',
        sectionType: FileType.image,
      ),
      UploadedFile(
        id: 'img_3',
        name: 'screenshot.webp',
        size: 256000, // 250KB
        mimeType: 'image/webp',
        lastModified: DateTime.now().subtract(const Duration(hours: 8)),
        fileExtension: 'webp',
        sectionType: FileType.image,
      ),
      UploadedFile(
        id: 'img_4',
        name: 'profile.gif',
        size: 768000, // 750KB
        mimeType: 'image/gif',
        lastModified: DateTime.now().subtract(const Duration(days: 3)),
        fileExtension: 'gif',
        sectionType: FileType.image,
      ),
    ];
  }

  /// Simulate loading Video files
  Future<List<UploadedFile>> getVideoFiles() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));
    
    return [
      UploadedFile(
        id: 'vid_1',
        name: 'presentation.mp4',
        size: 15728640, // 15MB
        mimeType: 'video/mp4',
        lastModified: DateTime.now().subtract(const Duration(days: 2)),
        fileExtension: 'mp4',
        sectionType: FileType.video,
      ),
      UploadedFile(
        id: 'vid_2',
        name: 'demo.webm',
        size: 8388608, // 8MB
        mimeType: 'video/webm',
        lastModified: DateTime.now().subtract(const Duration(hours: 12)),
        fileExtension: 'webm',
        sectionType: FileType.video,
      ),
    ];
  }

  /// Load files for specific section
  Future<List<UploadedFile>> getFilesForSection(String sectionType) async {
    final fileTypeEnum = FileType.fromString(sectionType);
    if (fileTypeEnum == null) {
      return [];
    }

    switch (fileTypeEnum) {
      case FileType.pdf:
        return getPdfFiles();
      case FileType.txt:
        return getTxtFiles();
      case FileType.image:
        return getImageFiles();
      case FileType.video:
        return getVideoFiles();
    }
  }

  /// Simulate error for testing (can be used later)
  Future<List<UploadedFile>> getFilesWithError(String sectionType) async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Failed to load $sectionType files from server');
  }
}
