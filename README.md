# College WiFi Auto-Login App **Infinity9**

## Note

**Exclive for VIT-AP University**

This is the final implementation of app. App Icon Will be added
- **Future Updates**
   - Will add textfeilds for user input

This Flutter-based application simplifies the login process for our college WiFi network by bypassing unnecessary manual logouts and re-logins. Designed for **Android** and **iOS**, the app leverages a known loophole to provide seamless and automatic connectivity to the college network.

---

## Key Features

- **Automatic Login**: Users only need to enter their credentials (Reg No and Password) once. The app ensures automatic login whenever the app is opened.
- **No Logout Required**: Switching between different blocks on campus no longer requires logging out and logging in repeatedly.
- **Bypass Over-Limit Errors**: Resolves the issue where users hit login limits by efficiently handling WiFi requests.
- **Client-Side Restriction Workaround**: Injects JavaScript to fill login fields with superscript-generated credentials bypassing client-side restrictions.
- **Algorithm-Based Login Generation**: Generates all possible login variations using algorithms developed by **Tarun**.

---

## How It Works

1. **Loophole**: The college WiFi login system previously allowed **superscripted Reg No** inputs, which was later patched with client-side validation. However, this patch does not impact backend fetch requests.
2. **JavaScript Injection**: The app injects JavaScript into the login form to programmatically fill fields with algorithm-generated credentials, bypassing client-side restrictions.
3. **Exploit**: By inspecting the network requests and sending manual fetch calls with superscripted Reg Nos, the app bypasses the frontend restrictions.
4. **Persistent Login**: The app maintains user credentials securely and sends fetch requests to automatically log in without user intervention.

---

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Networking**: `http` package to send fetch requests to the WiFi login endpoint.
- **JavaScript Injection**: Injecting custom scripts for bypassing restrictions.
- **Storage**: Securely saves user credentials using `flutter_secure_storage`.
- **Cross-Platform**: Works on both **Android** and **iOS**.

---

## Setup Instructions

### Prerequisites
- Flutter SDK installed (v3.0+ recommended)
- Dart SDK
- Android Studio / Xcode for device emulation

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kiran-katakam/infinity.git
   cd infinity
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   - Android:
     ```bash
     flutter run -d android
     ```
   - iOS:
     ```bash
     flutter run -d ios
     ```

4. **Build APK/IPA (Optional)**:
   ```bash
   flutter build apk   # For Android
   flutter build ios   # For iOS
   ```


---

## Dependencies
- `http`: To send network requests
- `flutter_secure_storage`: Secure storage for sensitive data
- `WebView`: To show the user whats going on

---

## Usage
1. Open the app and enter your **Reg No** and **Password**.
2. Click **Login**. The app will save your credentials securely.
3. Whenever you open the app, it will **automatically log you in** without requiring manual interaction.
4. Enjoy seamless WiFi connectivity across the campus!

---

## Security Notes
- User credentials are stored securely using `flutter_secure_storage`.
- The loophole exploits a **server-side oversight** and bypasses client-side validation through JavaScript injection. Please use responsibly and ethically.

---

## Contributors
This project was a collaborative effort:
- **You**: Just Wrote the Code and contributed to find the loophole.
- **Tarun**: Developed the algorithm to generate all possible login variations,  and contributed to identifying the loophole.

---

## Disclaimer
This application is intended for educational purposes only and should be used responsibly. Any misuse or violation of university policies is strictly the user's responsibility.

---
