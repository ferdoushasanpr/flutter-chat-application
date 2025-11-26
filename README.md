# 📱 Flutter Chat Application

A real-time chat application built with **Flutter**, using **Firebase Authentication** for user login/sign-up and **Cloud Firestore** for storing user profiles and chat messages through the Firebase SDK.

---

## 🚀 Features

### 🔐 Authentication

* Sign up using email & password
* Sign in using Firebase Authentication
* Form validation & error handling

### 💬 Real-Time Chat

* One-to-many messaging
* Messages stored in Firestore
* Real-time updates using `StreamBuilder`

### 👤 User Management

* Stores user data in Firestore
* Each user can chat with all other users in the system

---

## 🛠️ Tech Stack

**Flutter** | **Dart** | **Firebase SDK** | **Firebase Core** | **Firebase Authentication** | **Cloud Firestore** 

---

## 📸 Screenshots

<img width="49%" height="100%" alt="Screenshot_1764176567" src="https://github.com/user-attachments/assets/e7e35e8a-a14a-4816-ae57-e813cbf4fa63" />
<img width="49%" height="100%" alt="Screenshot_1764176564" src="https://github.com/user-attachments/assets/d6e506b1-524e-4e17-af7d-ccafa809cab6" />
<img width="49%" height="100%" alt="Screenshot_1764176595" src="https://github.com/user-attachments/assets/cb9a6d18-7dd8-4619-9b8a-1ecd50785f69" />

---

## 🔧 Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/ferdoushasanpr/flutter-chat-application.git
cd flutter-chat-application
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Configure Firebase

* Create a Firebase project
* Enable **Email/Password Authentication**
* Create Firestore database
* Download `firebase_options.dart` using FlutterFire CLI
* Add it to your `lib/` folder
* Make sure it is **ignored** in `.gitignore`

### 4️⃣ Run the Application

```bash
flutter run
```

---

## 📝 License

This project is licensed under the **MIT License**.
Feel free to use, modify, and distribute as needed.

---

## ⭐ Show Your Support

If you like this project, please give it a **star ⭐** on GitHub—it helps others discover it!


