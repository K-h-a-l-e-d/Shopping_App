# Shopping App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

## Description
This is a Simple Shopping App built in flutter,
featuring Browsing Electronics Store products, diplaying Hot Offers along with add items to cart feature.

## Features

- 🌐 Multi-language support (English/Arabic)
- 🔥 Firebase Authentication
- 🔐 Biometric Authentication (👤Face ID /👆Fingerprint) 
- 🛍 Product catalog display
- 🛒 Basic shopping cart functionality
- 🔄 Right-to-Left (RTL) layout support
- 🎨 Responsive UI design
- 🌓 Dark/Light mode

## Core Functionality Overview
 - Product Display: Grid and List views with products' data(Picture/Name/Hot Offers ) along with add to cart Icon
 - Firebase Integration: signup and login with Firebase email/password method
 - Authentication: Firebase authentication & device biometric authentication gate on user profile page 
 - Navigation: Drawer and Bottom Navigation Bar
 - User Profile: Basic profile display with Firebase user data
 - Localization: English/Arabic support using EasyLocalization

 ## Application Workflow Abstract

1. Initialization Phase (main.dart)

    Firebase Setup: Initializes Firebase services using platform-specific configurations

    Localization: Configures bilingual support (EN/AR) with EasyLocalization

    Theme System: Implements reactive dark/light mode via ValueNotifier state management

2. Core Authentication Flow

    Email/Password Auth:
    SignUpPage → Firebase createUserWithEmailAndPassword → User credential storage
    LoginPage → Firebase signInWithEmailPassword → Session management

    Biometric authentication Gate (profile.dart):
    LocalAuthApi → Device-native Biometric auth → Conditional User profile access

3. UI Rendering Pipeline

    Navigation Architecture:
    BottomNavigationBar ↔ Home()/Profile()
    NavigationDrawer → Language toggle Button ↔ Dark/Light Theme switcher Button ↔ Auth status: Log out button appears only during login sessions  

    Product Display:
    products_inventory.dart → GridView/ListView builders → products' data(Picture/Name/Hot Offers) along with add to cart Icon

    RTL Support:
    context.locale detection → Dynamic layout direction

4. State & Data Flow

    Global Flags (flags.dart):
    ValueNotifier<bool> for:

        isDarkThemeEnabled → application Theme rebuild

        isLoggedIn → Auth state propagation

    User Data:
    FirebaseAuth → currentUser → Profile display

5. Helper Modules

    Validators: Email/password regex checks(making sure user provide a valid email/and a Password 6 chars long atleast)

    Animations: Custom FadeTransitionPageRoute → navigate with animation on a successfull sign up process

    Navigation Utilities:
    navigateTo()/navigateWithReplacementTo() → Route Page 


## Application Screenshots: 
|![ProductsPage](https://github.com/user-attachments/assets/c2cb11db-f4df-446e-9952-ab6f41167ccf)|![ProductsPageExtension](https://github.com/user-attachments/assets/716746c4-68aa-4cc5-9c5d-48627fa046a2)|![ProfilePage](https://github.com/user-attachments/assets/e2104884-7d78-44b9-9e95-3e790610b599)|
|-|-|-|
|![LoginPage](https://github.com/user-attachments/assets/50f722f8-5e43-4a19-92d4-4446f1d1062e)|![SignupPage](https://github.com/user-attachments/assets/38c11403-ea3a-406e-8e51-46f5e6b29c14)|![Drawer](https://github.com/user-attachments/assets/954ee093-1de8-4515-81ab-8e6863bd000f)|
|-|-|-|
|![s1](https://github.com/user-attachments/assets/eccb7741-4616-463a-ae1d-94815bc9b4f6)|![s2](https://github.com/user-attachments/assets/cba7340b-9cd4-46af-ad5e-b797bd1996f0)|![s4](https://github.com/user-attachments/assets/2514a5c1-8523-47e3-a824-60946802d615)|
|-|-|-|
|![Biometric_Authentication](https://github.com/user-attachments/assets/9385e045-b506-4672-8b91-9e931fd83fac)|![Dark_Mode](https://github.com/user-attachments/assets/01c6bcea-5b85-41b2-aa9c-a860ae45f5f3)||

## App Overview Video:
https://github.com/user-attachments/assets/c28b8710-4bd1-4e41-9d21-6ca9a9f07517

## Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/K-h-a-l-e-d/Shopping_App
   cd Shopping_App
2. **Install dependencies**
```bash
flutter pub get
```
3. **Run the app**
```bash
flutter run
```
