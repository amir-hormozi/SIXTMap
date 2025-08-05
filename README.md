# 🚗 iOS Map Showcase App

This is an iOS showcase application demonstrating the implementation of a map-based app using **Clean Architecture** and modern development practices. The app fetches a list of cars from a remote API and displays their locations on a map in an optimized and user-friendly manner.

Built upon a solid and scalable foundation, the project showcases software engineering principles like **SOLID** and **Protocol-Oriented Programming (POP)** in a practical, real-world example.

---

## ✨ Features

- ✅ **Fetch Car List** – Asynchronously fetches a list of cars from a remote API.
- 📍 **Map Display** – Renders each car as a custom annotation pin on an `MKMapView`.
- 🗺️ **Smart Zoom** – Automatically adjusts the map's region to focus on relevant data points.
- 🏗️ **Modular Structure** – Fully modular and scalable architecture that simplifies feature expansion.

---

## 🧠 Architecture

This project follows the **Clean Swift (VIP)** architecture pattern, chosen for its:

- **🔄 Separation of Concerns** – Clear, single-responsibility components and unidirectional data flow.
- **✅ High Testability** – Protocol-based abstraction and dependency injection for easy mocking and testing.
- **📈 Scalability & Maintainability** – Easier onboarding, feature expansion, and collaboration.

### 💡 VIP Layer Responsibilities

- **View** – Displays UI and captures user input (Passive View).
- **Interactor** – Contains business logic for each scene.
- **Presenter** – Prepares data from Interactor for display.
- **Worker** – Handles networking, caching, or database interactions.
- **Router** – Manages navigation and data passing between scenes.

---

## 🛠️ Tech Stack

| Category        | Tech Used                              |
|-----------------|-----------------------------------------|
| **Language**    | Swift 5+                                |
| **UI**          | UIKit, MapKit                           |
| **Architecture**| Clean Swift (VIP)                       |
| **Concurrency** | Swift Concurrency (async/await)         |
| **Networking**  | Generic, protocol-based networking layer|
| **Design**      | SOLID, Protocol-Oriented Programming, DI|

---

## 🚧 Future Improvements

- ✅ Write comprehensive unit tests for Interactor and Presenter layers.
- 🎨 Design a custom `CalloutView` for map pin tap interactions.
- 💾 Add local data caching to improve performance and enable offline support.
- 🔄 Migrate to **SwiftUI** for showcasing modern UI development with `UIKit` interoperability.
