# Skill_Hub

## Overview
**Skill_Hub** is a Flutter mobile application designed to provide a smooth learning experience for students and instructors. The app uses **Provider** for state management and **Firebase** for authentication and database.

It supports **role-based authentication**, allowing users to register as either **Student** or **Instructor**, and includes **light and dark theme** support.

The app has a modern UI, responsive layout, and intuitive navigation for easy access to courses and user profile.

---

## Folder Structure

lib/
├─ core/
│ ├─ constants/
│ │ ├─ app_colors.dart
│ │ └─ app_text.dart
│ ├─ theme/
│ │ └─ app_theme.dart
│ ├─ utils/
│ │ └─ validators.dart
│ └─ exceptions/
│ └─ app_exceptions.dart
├─ models/
│ └─ app_user.dart
├─ providers/
│ ├─ auth_provider.dart
│ └─ theme_provider.dart
├─ services/
│ ├─ firebase_service.dart
│ └─ auth_service.dart
├─ widgets/
│ ├─ common_text_field.dart
│ ├─ common_button.dart
│ └─ featured_card.dart
├─ screens/
│ ├─ splash_screen.dart
│ ├─ auth/
│ │ ├─ login_screen.dart
│ │ └─ signup_screen.dart
│ └─ main_app/
│ ├─ home_screen.dart
│ ├─ home_tab.dart
│ ├─ courses_tab.dart
│ └─ profile_tab.dart
├─ firebase_options.dart
└─ main.dart


## Screens

1. **Splash Screen**
    - Displays app logo and initializes Firebase.

2. **Signup Screen**
    - Register a new account using email, password, and role (Student/Instructor).
    - Includes validation and error messages.

3. **Login Screen**
    - Login using email and password.
    - Displays error messages for invalid credentials.

4. **Home Screen**
    - Main landing page with a bottom navigation bar (Home, Courses, Profile).
    - Hero banner at the top with text:  
      *"Explore premium courses curated for industry"*

5. **Home Tab**
    - Shows featured courses and promotional content.

6. **Courses Tab**
    - Displays list of courses in card layout with icons.
    - Fully supports light and dark themes.

7. **Profile Tab**
    - Shows user email and role.
    - Allows updating email and role.
    - Logout option included.

---

## Features

- Role-based authentication (Student / Instructor)
- Firebase Authentication & Firestore integration
- Profile update functionality
- Light and Dark theme support
- Responsive and user-friendly UI
- Smooth page transitions and animations

---

## Developer Introduction

**Name:** Ashar Minhas  
**Experience:** 1 year of experience in Flutter development.

During this one year, I have worked with **Bloc, Riverpod, Provider, local storage**, responsive designs, **Firebase, Supabase**, and many other features. I have also worked extensively with **API integration**.

I recently joined **Murick Technologies** as an intern and successfully completed the first task assigned to me.

This project, **Skill_Hub**, does not require API integration according to the initial project description. However, I have maintained the code in a way that it can easily be integrated with a backend in the future. Additionally, I have added some improvements to ensure the app is scalable, responsive, and maintainable.

I am passionate about building scalable and user-friendly mobile apps that provide a smooth and intuitive experience.


## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Set up Firebase using `firebase_options.dart`.
4. Run `flutter run` on your device or emulator.

---

## Notes

- Fully functional in light and dark modes.
- Responsive design for modern mobile devices.
- Feature-based folder structure for easy maintenance and scalability.
