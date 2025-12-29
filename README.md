🛡️ SafeHer Travel — Tourist Safety App

A panic-safe mobile application designed to support solo women travelers during emergency situations.
The app focuses on fast SOS activation, clear emergency states, and future-ready backend integration.

📌 Problem Statement

Solo travelers—especially women—often face safety risks such as:

Lack of immediate help during emergencies

Inability to quickly alert trusted contacts

Panic-induced decision paralysis

SafeHer Travel addresses this by providing a single-action SOS system with a stress-proof user experience.

🎯 Core Objective

To build a panic-safe, reliable, and scalable tourist safety app that allows users to:

Trigger emergency alerts quickly

Share location during distress

Reassure users that help is being notified

Safely exit emergency mode when secure

🧩 Project Architecture (Current Phase)
✅ Phase 1 — Frontend (COMPLETED)

Flutter-based cross-platform UI

Panic-safe SOS UX flow

Clean screen separation

Service layer abstraction (mock backend)

Demo-ready and stable

🔄 Phase 2 — Backend (IN PROGRESS / NEXT)

Flask-based REST API

SOS persistence and lifecycle management

SMS / alert integrations

Location tracking

📱 Application Flow (Frontend)
Login
  ↓
Home Screen
  ↓ (Long Press)
SOS Countdown (Cancel possible)
  ↓
SOS Alert Sent
  ↓
"I'm Safe" → Return to Home

Panic-Safe UX Features

Long-press SOS to avoid accidental triggers

Countdown with cancel option

Back button disabled during SOS states

Haptic feedback on critical actions

Single-purpose emergency screens

🧠 Tech Stack
Frontend

Flutter (Dart)

Material UI

State-managed screen flow

Backend (Planned)

Python (Flask)

REST APIs

SQLite / PostgreSQL

SMS Gateway (Twilio / Fast2SMS)

📂 Project Structure
lib/
├── main.dart
├── screens/
│   ├── login_page.dart
│   ├── signup_page.dart
│   ├── home_page.dart
│   ├── sos_countdown_page.dart
│   └── sos_sent_page.dart
├── services/
│   └── sos_service.dart   // mock backend abstraction

🔗 SOS API Contract (Planned)
Trigger SOS
POST /api/sos


Request

{
  "user_id": "string",
  "location": { "lat": 0.0, "lng": 0.0 },
  "timestamp": "ISO-8601"
}


Response

{
  "sos_id": "SOS_123456",
  "status": "sent"
}

Resolve SOS
POST /api/sos/{sos_id}/resolve

👥 Team Workflow

main branch → stable code only

Frontend frozen after Phase 1

Backend & ML work on separate branches

All merges via pull requests

🚀 How to Run (Frontend)
flutter pub get
flutter run


Supports:

Chrome (web)

Android Emulator

Physical Android devices

📌 Current Status

🟢 Frontend: Completed (Phase 1)

🟡 Backend: In Progress

⚪ ML / Risk Analysis: Planned

📣 Future Enhancements

Real-time location streaming

SMS & push notifications

Nearby help (police / hospitals)

AI-based risk detection

Multilingual support

📄 License

This project is developed for academic and demonstration purposes.

✅ Next Step for Team Members

Pull latest main

Start backend development using the defined SOS API contract