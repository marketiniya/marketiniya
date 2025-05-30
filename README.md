# Marketinya - Marketing Website & Client Management System

A comprehensive Flutter web application featuring a marketing website and an admin client management system, built with Firebase backend and multi-environment support.

## ✨ Features

### 🌐 Marketing Website
- **Home Page**: Business overview and services showcase
- **Services Page**: Detailed marketing services information
- **Blog**: Marketing news and insights (Bulgarian content)
- **Contact Forms**: Lead generation and client inquiries
- **Newsletter Subscription**: Email list management
- **Responsive Design**: Mobile and desktop layouts
- **Multi-language Support**: Bulgarian content

### 🏢 Admin System (Client Management)
- **Client Management**: Add, edit, and manage client information
- **Business Sectors**: Categorize clients by industry
- **Priority Levels**: Set client priority levels
- **Social Media Links**: Track client social media presence
- **Tags System**: Organize clients with custom tags
- **Authentication**: Secure admin access
- **Desktop Optimized**: Admin interface for desktop use

### 🔧 Technical Features
- **Multi-Environment**: Separate development (WIP) and production (PROD) environments
- **Firebase Backend**: Authentication, Firestore database, hosting
- **Responsive Architecture**: Separate mobile/desktop layouts
- **Route Protection**: Public website + protected admin routes

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (latest stable)
- Web browser
- Firebase account

### Getting Started
1. **Clone the repository**
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the application**:
   ```bash
   flutter run -d chrome
   ```

### Accessing Different Parts

After running the application, you can access:

## 🌍 Environment Configuration

This project supports two environments:
- **WIP** (Work In Progress) - Development environment
- **PROD** (Production) - Production environment

#### Android Studio Run Configurations:
1. Go to `Run` → `Edit Configurations...`
2. Click `+` → `Flutter`
3. Set up configurations:

**WIP Configuration:**
- Name: `Flutter WIP`
- Dart entrypoint: `lib/main.dart`
- Additional run args: `--dart-define=environment=wip`

**PROD Configuration:**
- Name: `Flutter PROD`
- Dart entrypoint: `lib/main.dart`
- Additional run args: `--dart-define=environment=prod`

### Environment Verification

When you run the application, check the console output to verify the environment:

**WIP Environment:**
```
🔥 Firebase Environment: WIP
🔥 Project ID: marketiniya-wip
```

**PROD Environment:**
```
🔥 Firebase Environment: PROD
🔥 Project ID: marketinya-a4876
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── config/
│   │   ├── environment_config.dart    # Environment management
│   │   └── firebase_options.dart      # Firebase configuration
│   ├── design_system/                 # Shared UI components
│   ├── navigation/                    # Route management
│   └── repositories/                  # Data layer
├── website/                           # Marketing Website
│   ├── pages/
│   │   ├── home/                      # Home page layouts
│   │   ├── services/                  # Services page
│   │   └── connect_with_us/           # Contact page
│   ├── screens/
│   │   └── blog/                      # Blog functionality
│   ├── widgets/                       # Website-specific widgets
│   ├── models/                        # Website data models
│   └── data/                          # Static content data
├── system/                            # Admin System
│   ├── auth/                          # Authentication screens
│   └── screens/
│       └── clients/                   # Client management interface
└── main.dart                          # Application entry point
```

## 🌐 Application Routes

### Public Routes (Marketing Website)
- `/home` - Marketing homepage
- `/services` - Services information
- `/blog` - Marketing blog
- `/connect-with-us` - Contact forms

### Protected Routes (Admin System)
- `/login` - Admin authentication
- `/system/clients` - Client management dashboard