# Flutter Interview App

A high-performance Flutter application built with **GetX** and **Firebase**, featuring a complete authentication flow and provider management system.

## Features
- **Auth & Profile**: Secure login/signup and profile updates (Firestore).
- **Service Providers**: One-click upgrade for users to become providers.
- **Modern UI**: Polished, card-based layouts and modular widget architecture.

## Setup & Configuration
The project is configured for Firebase project: **`flutter-interview-12a07`**.

```bash
# Install dependencies
flutter pub get

# Setup Firebase (optional)
flutterfire configure --project=flutter-interview-12a07
```

## Maintenance & Running
Use the provided `clean.sh` for a fresh rebuild (requires FVM):
```bash
chmod +x clean.sh
./clean.sh
```

To run the application:
```bash
flutter run
```

## Architecture
This project uses a modular, class-based design. Each screen is composed of stateless specialized widgets instead of monolithic views, ensuring optimized rebuilds and clean code separation.
