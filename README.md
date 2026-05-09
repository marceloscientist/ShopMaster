# ShopMaster 🛒

ShopMaster is an iOS application developed using **SwiftUI** as part of the
Capgemini / Proway iOS training program.

The goal of this project is to build a shopping experience that allows users
to browse product sections, add items to a cart, manage quantities, and view
the total purchase value, following modern iOS architecture and best
practices.

---

## 📱 Features

- Navigation across multiple product sections
- Product listing and selection
- Add products to the shopping cart
- View cart items with quantities
- Remove items from the cart
- Display the total purchase amount
- Shared cart state across the application

---

## 🧱 Architecture

The project follows a **feature-based architecture** using the **MVVM
(Model–View–ViewModel)** pattern.

The main goals of this architecture are clarity, scalability, and separation
of responsibilities.

### Architectural Highlights

- **SwiftUI** for declarative UI development
- **MVVM** for clean separation between views and business logic
- Feature-oriented folder structure
- Shared state management using observable ViewModels

### Main Layers

- **App**  
  Application entry point and root configuration.

- **Features**  
  Each feature is isolated and self-contained:
  - Home
  - Products
  - Cart

- **Core**  
  Shared models, services, and navigation-related logic.

- **UI / Components**  
  Reusable user interface components shared across features.

---

## 🚀 Technologies Used

- Swift
- SwiftUI
- Combine

---

## ▶️ How to Run

1. Open the project file:
   ShopMaster.xcodeproj
2. Select a simulator or physical device.
3. Build and run the project using Command + R.

---

## 📌 Notes

This project focuses on applying clean architecture principles, state
management, and navigation patterns using SwiftUI.

ShopMaster represents a progression from basic exercises to a more realistic
and scalable iOS application, serving as a foundation for future feature
expansion and improvements.
``