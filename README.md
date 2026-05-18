# Project Aether

A production-grade Flutter MMORPG event system built with GetX and Firebase.

---

## 🌍 Features

### Global Pulse
- Real-time World Boss countdown
- Updates every 100ms
- Reactive GetX-based UI updates
- Performance-optimized rendering

### Geo Raid
- Exactly 15 raid slots
- Concurrency-safe join system
- Atomic Firestore transactions
- Duplicate join prevention

### Engagement Chat
- Realtime Firebase chat
- Reactive messaging system
- Scalable architecture patterns

---

## 🏗️ Architecture

The project follows a modular MVC architecture using GetX.

### Structure
- **Bindings** → dependency injection
- **Controllers** → reactive business logic
- **Views** → declarative UI
- **Repositories** → Firebase operations

This separation ensures:
- scalability
- maintainability
- clean state management
- isolated business logic

---

## ⚡ Concurrency Strategy

Raid joins are handled using Firestore transactions:

```dart
FirebaseFirestore.instance.runTransaction(...)
```

This ensures raid joins remain safe under extreme concurrency.

## Guarantees

- atomic updates
- zero race conditions
- duplicate prevention
- exactly 15 successful joins under heavy concurrent requests

All validation (slot checks, duplicates, capacity limits) happens inside the transaction scope.

---

## 📉 Firebase Scaling Strategy

If 10,000 players are chatting simultaneously, realtime listeners should only observe a limited recent message window using `.limit(50)` instead of streaming entire collections.

### Optimization strategies:

- cursor-based pagination for history
- channel/shard-based chat splitting
- reduced listener fan-out

For extremely high-frequency ephemeral messaging, Firebase Realtime Database can be more cost-efficient than Firestore due to bandwidth-based billing.

---

## ⚙️ Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run

## 🧪 Testing

```bash
flutter test test/raid_concurrency_test.dart
flutter analyze
dart aether_linter.dart
```

📦 Tech Stack
   • Flutter
   • Dart
   • GetX
   • Firebase Firestore
   • Firebase Authentication
   • Freezed
   • JsonSerializable

🌌 Notes

Project Aether was engineered as a systems-thinking exercise focused on:

   -distributed concurrency
   -realtime UI performance
   -scalable Firebase architecture
   -reactive state management
   -production-grade Flutter engineering