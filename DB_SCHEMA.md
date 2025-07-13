# Database Structure

## Firestore Collections

### `clients` Collection
```
clients/
├── {clientId}/
│   ├── companyName: String
│   ├── name: String
│   ├── dateOfBirth: Timestamp
│   ├── businessSector: String
│   ├── companyId: String
│   ├── personalId: String
│   ├── phone: String
│   ├── status: String
│   ├── priorityLevel: String
│   ├── description: String
│   ├── assignedTo: DocumentReference
│   ├── tags: List<DocumentReference>
│   ├── socialLinks: List<Map>
│   ├── createdAt: Timestamp
│   ├── updatedAt: Timestamp
│   │
│   └── attachments/
│       └── {fileId}/
│           ├── id: String
│           ├── name: String
│           ├── fileType: String
│           ├── size: int
│           ├── mimeType: String
│           ├── storagePath: String
│           ├── downloadUrl: String
│           ├── lastModified: Timestamp
│           └── uploadedAt: Timestamp
```

### `users` Collection
```
users/
├── {userId}/
│   ├── email: String
│   ├── displayName: String
│   ├── role: String
│   ├── createdAt: Timestamp
│   └── lastLogin: Timestamp
```

### `tags` Collection
```
tags/
├── {tagId}/
│   ├── name: String
│   ├── color: String
│   └── createdAt: Timestamp
```

### `questions` Collection
```
questions/
├── {questionId}/
│   ├── name: String
│   ├── email: String
│   ├── phone: String
│   ├── message: String
│   ├── createdAt: Timestamp
│   └── status: String
```

### `subscriptions` Collection
```
subscriptions/
├── {subscriptionId}/
│   ├── email: String
│   ├── name: String
│   ├── createdAt: Timestamp
│   └── status: String
```

## Firebase Storage Structure

```
attachments/
├── {clientId}/
│   ├── pdf/
│   │   ├── {fileId1}.pdf
│   │   └── {fileId2}.pdf
│   │
│   ├── image/
│   │   ├── {fileId3}.jpg
│   │   ├── {fileId4}.png
│   │   └── {fileId5}.webp
│   │
│   └── txt/
│       ├── {fileId6}.txt
│       ├── {fileId7}.docx
│       └── {fileId8}.xlsx
```

## Relationships

- **Client-User**: Each client is assigned to a user (`assignedTo` field)
- **Client-Tags**: Clients can have multiple tags (`tags` field)
- **Client-Attachments**: One-to-many relationship via subcollection
- **Attachments-Storage**: Each attachment document references a file in Firebase Storage
