# Project Aether

A highly scalable, deeply-typed Flutter architecture built for production. Designed to handle massive concurrency, mitigate race conditions, and drastically minimize cloud billing costs through optimized reactive patterns.

## 🏛️ Architecture Explanation

Project Aether leverages a strictly-typed **MVC (Model-View-Controller)** pattern natively powered by **GetX**. 
The architecture is isolated into robust modules to ensure complete separation of concerns and scalable maintenance:

* **Core Layer**: Houses global configurations, constants, deterministic error handling boundaries, and base platform services (e.g., `FirebaseService`).
* **Data Layer**: 
  * **Models**: Deeply immutable, auto-generated data schemas utilizing `Freezed` and `JsonSerializable`. Guaranteed zero mutable state across the app.
  * **Repositories**: The deterministic single source of truth for remote data mutations. Completely abstracts Firebase/API logic away from the domain layer.
* **Domain & Presentation Layer (Modules)**: Features are horizontally isolated into modules (`/home`, `/raid`, `/chat`, `/countdown`).
  * **Bindings**: Memory-efficient dependency injection via `Get.lazyPut()`. Controllers and Repositories are instantiated strictly at the route level and garbage-collected automatically upon pop.
  * **Controllers**: Contains pure reactive business logic, observable streams (`RxList`, `RxBool`), and interaction delegates.
  * **Views**: Fully logic-free, purely declarative UI layers leveraging `GetView<T>` and `Obx()` for surgically granular widget rebuilding.

---

## ⚡ Concurrency Strategy

High-frequency multi-user environments, such as the **Raid Join System**, are mathematically designed to withstand "Thundering Herd" scenarios (e.g., 50+ users dispatching join requests simultaneously).

* **Transaction Atomicity**: All concurrent remote writes are funneled through `FirebaseFirestore.instance.runTransaction()`. This establishes deterministic read-modify-write locks on documents, preventing dirty reads.
* **Threshold Verification**: Document manipulations strictly validate array bounds (`participantIds.length >= maxParticipants`) dynamically *inside* the transaction scope, ensuring exactly 15 users ever succeed under heavy load.
* **Duplicate Prevention**: Operations remain purely idempotent by evaluating `participantIds.contains(userId)` against the transaction's locked payload.

---

## 📉 Firebase Scaling & Cost Optimization Strategy

To remain remarkably cost-efficient at high CCU (Concurrent Users), Project Aether implements strict read-minimization optimizations:

* **Truncated Listener Windows**: Real-time listeners would only observe the newest message window, explicitly bound by temporal filters (e.g., `where('timestamp', isGreaterThanOrEqualTo: startTime)`), ensuring active sockets only ever bill for *new* incoming data.
* **Cursor-Based Pagination**: Older messages would be fetched using paginated queries via stateless, non-listening Future chunks utilizing `startAfterDocument()`.
* **Sharding & Partitioning**: Chat traffic could be partitioned by channels or regional shards to reduce hot collection contention and listener fan-out.
* **Aggressive Memory Profiling**: Memory leaks are prevented explicitly by enforcing `Timer.cancel()` and terminating active `ScrollControllers` inside the `GetxController.onClose()` lifecycle.

---

## ⚙️ Setup Instructions

To deploy Project Aether locally:

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
2. **Generate Immutable Schemas**:
   Because the data layer strictly adheres to `Freezed`, you must generate the JSON serialization files before compilation:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. **Environment Constraints**:
   Verify you are operating on Flutter SDK `^3.10.0`.
4. **Compile & Run**:
   ```bash
   flutter run
   ```

---

## 🧪 Testing Instructions

The architecture comes fully equipped with strict static analysis and complex concurrency testing logic.

**To validate concurrency threshold logic:**
```bash
flutter test test/raid_concurrency_test.dart
```

**To enforce strict typing architectures:**
```bash
flutter analyze
```
*(Note: A highly rigid `analysis_options.yaml` is deployed to enforce `always_specify_types` globally. Expected warnings may safely persist inside auto-generated `.g.dart` schema files and custom development linter scripts).*
