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
- **Client Management**: Add, edit, and manage client information with tabbed interface
- **Information Tab**: Complete client form with 3-column layout (basic info, IDs/contact, social media)
- **Attachments Tab**: File upload and management system
- **Business Sectors**: Categorize clients by industry (restaurants, hotels, online stores, etc.)
- **Priority Levels**: Set client priority levels (low, medium, high, urgent)
- **Social Media Links**: Track client social media presence with platform detection
- **Tags System**: Organize clients with custom tags and visual chips
- **Authentication**: Secure admin access with Firebase Auth
- **Desktop Optimized**: Admin interface designed for desktop workflows

### 🔧 Technical Features
- **Multi-Environment**: Separate development (WIP) and production (PROD) environments
- **Firebase Backend**: Authentication, Firestore database, hosting, file storage
- **Responsive Architecture**: Separate mobile/desktop layouts with responsive components
- **Route Protection**: Public website + protected admin routes with authentication
- **State Management**: BLoC pattern for predictable state management
- **Design System**: Atomic design with reusable components (atoms, molecules, organisms)
- **File Management**: Drag & drop file uploads with validation and type detection

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
- Additional run args: `--dart-define=environment=wip --dart-define=VAULT_API_KEY=<your_vault_api_key>`

**PROD Configuration:**
- Name: `Flutter PROD`
- Dart entrypoint: `lib/main.dart`
- Additional run args: `--dart-define=environment=prod --dart-define=VAULT_API_KEY=<your_vault_api_key>`

## 📁 Project Structure

```
lib/
├── core/
│   ├── config/
│   │   ├── environment_config.dart    # Environment management
│   │   ├── firebase_options.dart      # Firebase configuration
│   │   └── service_locator.dart       # Dependency injection
│   ├── design_system/                 # Atomic Design System
│   │   ├── atoms/                     # Basic building blocks (colors, spaces, icons)
│   │   ├── molecules/                 # Component combinations
│   │   │   ├── button/                # Button variants
│   │   │   ├── fields.dart            # Form field components
│   │   │   └── icons/                 # Interactive icon components
│   │   └── themes/                    # App theming
│   ├── navigation/                    # Route management
│   ├── repositories/                  # Data layer
│   └── models/                        # Shared data models
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
│           ├── widgets/
│           │   ├── clients_table/     # Client listing and table
│           │   └── client_editor/     # Client creation/editing
│           │       ├── bloc/          # State management
│           │       ├── enums/         # Client-related enums
│           │       ├── shared/        # Shared components
│           │       │   ├── drawer/    # Navigation drawer
│           │       │   └── layout/    # Layout utilities
│           │       └── tabs/          # Feature tabs
│           │           ├── information_tab/  # Client form tab
│           │           │   ├── constants/    # Tab-specific constants
│           │           │   ├── services/     # Business logic services
│           │           │   └── widgets/      # Form components
│           │           └── attachments_tab/  # File management tab
│           │               ├── bloc/         # File upload state
│           │               ├── models/       # File models
│           │               ├── services/     # File validation
│           │               └── widgets/      # File UI components
│           └── models/                # Client data models
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
- `/system/clients/add` - Add new client
- `/system/clients/edit/:id` - Edit existing client

## 🎨 Design System

The application uses an **Atomic Design System** for consistent and scalable UI:

### Atoms (Basic Building Blocks)
- **Colors**: Consistent color palette with semantic naming
- **Spaces**: Standardized spacing values (xs, sm, md, lg, xl, etc.)
- **Icons**: Custom icon set with hover states and interactions

### Molecules (Component Combinations)
- **Buttons**: Primary, secondary, tertiary variants with responsive behavior
- **Form Fields**: Consistent input fields with validation states
- **Interactive Icons**: Hoverable icons with state management