
# SafeHer Travel — Tourist Safety App (Frontend)

SafeHer Travel is a **mobile-first safety application** designed to support **solo women travellers** during emergencies and risky situations.  
This repository contains the **Flutter frontend** of the project, focusing on user experience, SOS workflows, and safety-oriented UI/UX.

---

## 🚨 Problem Statement

Solo women travellers often face:
- Unsafe or unfamiliar environments
- Delayed access to emergency help
- Lack of trusted contacts nearby
- Panic situations where quick action is critical

SafeHer Travel addresses these challenges by providing a **panic-safe SOS system**, live location sharing, and access to nearby help.

---

## 🎯 Target Users
- Solo women travellers
- Women commuting late hours
- Tourists in unfamiliar locations

---

## 🧩 Features Implemented (Frontend Phase 1)

### ✅ Authentication UI
- Login page
- Signup page
- Navigation between auth screens

### ✅ SOS Emergency Flow
- Long-press **SOS trigger**
- Countdown screen with:
  - Back button disabled
  - Cancel SOS option
- SOS sent confirmation screen
- “I’M SAFE” acknowledgement with haptic feedback

### ✅ Safety Dashboard
- Live location (UI placeholder)
- Nearby help (UI placeholder)
- AI Safety Assistant (UI placeholder)

### ✅ UX & Safety Enhancements
- Panic-safe interactions
- Back navigation locking on critical screens
- Clean, minimal, accessibility-friendly UI
- Haptic feedback on safety actions

---

## 🗂️ Project Structure

```
lib/
 ├── screens/
 │    ├── login_page.dart
 │    ├── signup_page.dart
 │    ├── home_page.dart
 │    ├── sos_countdown_page.dart
 │    └── sos_sent_page.dart
 │
 ├── services/
 │    └── sos_service.dart
 │
 └── main.dart
```

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- Material Design
- Cross-platform (Android, iOS, Web, Desktop)

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (stable)
- Android Studio / VS Code
- Chrome / Android Emulator

### Setup
```bash
git clone https://github.com/Arthan-rv/safeher-travel-safety-app.git
cd tourist_safety_app
flutter pub get
flutter run
```

---

## 🔮 Planned Features (Next Phases)

- Backend integration (Firebase / Flask API)
- Real-time GPS tracking
- SOS alerts to trusted contacts
- Police & hospital locator using Maps API
- AI-powered safety chatbot
- Background location & notifications
- Secure authentication & user profiles

---

## 👥 Team Collaboration

This repository is maintained as the **frontend layer**.

### Branch Policy
- `main` / `master` → stable frontend
- `backend` → backend & APIs
- `ml` → AI / ML models
- `integration` → full system testing

> ⚠️ Do not push directly to main without review.

---

## 🏫 Academic Context

This project is developed as part of a **tourist safety and emergency solution initiative**, focusing on real-world social impact and women safety.

---

## 📌 Disclaimer

This is a **prototype frontend**.  
Emergency features are simulated for demonstration and academic purposes.

---

## 📄 License
Educational / Academic Use Only
