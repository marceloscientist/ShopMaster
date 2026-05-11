 # ShopMaster 🛒

ShopMaster is an iOS application built with **SwiftUI**, focused on delivering a clear, accessible and inclusive shopping experience.

This project emphasizes **accessibility (A11Y)**, **predictable UX**, and **clean architecture**, simulating real-world e-commerce behavior while prioritizing usability over visual complexity.

---

## 🎯 Vision

The goal of this project is to build an application that:

- Is easy to understand at first glance
- Reduces cognitive load
- Works well for users with visual or cognitive challenges
- Provides clear and predictable navigation
- Reflects real shopping flows (cart → checkout → history)

---

## ✅ Features

### 🛍️ Products
- Product listing
- Add to cart
- Decrement quantity (1 by 1)
- Accessible interaction (no hidden behavior)

---

### 🛒 Cart
- Product list with quantity (`2 × Product`)
- Increment / decrement behavior
- Swipe to delete
- Clear visual total
- Confirm purchase flow

---

### ✅ Checkout
- Confirmation alert ("Purchase confirmed")
- Cart resets after checkout
- Purchase is stored locally (UserDefaults)

---

### 🏠 Home (Dashboard)
- Monthly total based on purchase history
- Last purchase summary (value-based)
- Static message:

```

Free shipping inside country

```

- Quick navigation actions:
- View Products
- View Cart

---

## ♿ Accessibility (A11Y)

Accessibility is a **core design principle**, not an extra feature.

### Key decisions:

- ✅ Use text instead of icon-only interfaces  
- ✅ Emphasize important values (Total, Quantity)  
- ✅ Avoid hidden states or implicit actions  
- ✅ Clear feedback messages (e.g., “Purchase confirmed”)  
- ✅ Reduce UI noise and ambiguity  

### Examples:

- Quantities always visible (`3 × Item`)
- Empty states clearly described
- Buttons reflect real actions (Confirm Purchase)
- No reliance on color alone

This app is designed considering:
- Low vision users
- Cognitive accessibility
- Reduced technical familiarity

---

## 🧱 Architecture

The project follows **Feature-Based + MVVM**

```

ShopMaster/
├── Core/
│   ├── Models/
│   ├── Services/
│   ├── ViewModels/
│   └── Navigation/
│
├── Features/
│   ├── Home/
│   ├── Products/
│   └── Cart/
│
├── UI/
│   └── Components/

```

---

### Principles

- Separation of concerns (View vs ViewModel)
- Shared state via `EnvironmentObject`
- Feature isolation
- Reusable UI components
- Simple persistence (UserDefaults)

---

## 🧩 Components

- `ProductRowView`
- `PriceView`
- `PrimaryButton`

Focused on:
- readability
- reuse
- accessibility

---

## ⚙️ Business Decisions

### ✅ Shipping

Shipping rules were intentionally simplified:

```

Free shipping inside country

```

Reason:
- Avoid confusion
- Avoid inconsistent rules
- Keep UX predictable

---

### ✅ Purchase Model

- Purchases store **total value only**
- No product breakdown (yet)
- Simplicity over complexity

---

## 🔄 State Management

- Cart shared globally (`CartViewModel`)
- Home reacts to changes via `onChange`
- Checkout triggers state updates

---

## 🚀 Planned Next Steps

### Functional
- Purchase history screen
- Last purchase details (items count)
- Monthly reset logic

---

### UX Improvements
- Cart badge (item count)
- Improved feedback after purchase
- Navigation refinement

---

### 🌍 Internationalization
- Multi-language support (EN / PT)
- Currency formatting
- Localization-friendly UI

---

### ♿ Accessibility Enhancements
- VoiceOver improvements
- Dynamic Type support
- Better contrast handling
- Reduced motion support

---

## 🧠 Learnings

This project demonstrates:

- MVVM architecture with SwiftUI
- Reactive UI updates
- Debugging real state issues
- Designing for accessibility-first UX

---

## 📌 Final Note

ShopMaster is not intended to be a full production e-commerce app.

Instead, it represents:

> A strong focus on clarity, inclusion and predictability,  
> ensuring that **all users can understand and interact with the interface easily**.

---

## 👨‍💻 Author

Marcelo Santana  
Solution Consultant III — Capgemini Brazil