import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference, String> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(String json) {
    return FirebaseFirestore.instance.doc(json);
  }

  @override
  String toJson(DocumentReference object) {
    return object.path;
  }
}
