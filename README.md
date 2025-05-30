# 📝 Flutter + NestJS ToDo Demo

> A simple full-stack ToDo app built with **Flutter (Web)** for the frontend and **NestJS** for the backend API.  
> Frontend hosted on **Firebase Hosting**, backend hosted on **Render**.

---

## 🚀 Live Demo

🌐 Frontend (Flutter Web):  
🔗 [https://todo-fb699.web.app](https://todo-fb699.web.app)

🖥️ Backend (NestJS API - Render):  
🔗 https://<your-backend-endpoint>.onrender.com

> ⚠️ Replace above with actual backend URL

---

## 📦 Tech Stack

| Layer     | Technology         |
|-----------|--------------------|
| Frontend  | Flutter (Web)      |
| Backend   | NestJS (TypeScript)|
| Hosting   | Firebase (frontend), Render (backend) |
| API       | RESTful + CORS     |
| Build Tool| Flutter CLI, Node.js |

---

## 📁 Project Structure

```
/frontend       ← Flutter web app
/backend        ← NestJS API
```

---

## ✅ Features

- ✅ Add, update, delete ToDo items
- ✅ Fetch ToDos from REST API
- ✅ Responsive UI with Flutter Web
- ✅ CORS enabled for cross-origin frontend/backend interaction
- ✅ Firebase Hosting for fast static delivery
- ✅ Render hosting for backend deployment

---

## 🛠️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-user/flutter-nest-todo-demo.git
cd flutter-nest-todo-demo
```

### 2. Frontend (Flutter Web)

```bash
cd frontend
flutter pub get
flutter run -d chrome
```

To build for production:

```bash
flutter build web
```

Deploy to Firebase:

```bash
firebase deploy
```

### 3. Backend (NestJS)

```bash
cd backend
npm install
npm run start:dev
```

To deploy to Render:
- Push code to GitHub
- Go to https://render.com
- Create new Web Service → select your backend repo → build command: `npm install && npm run build` → start command: `npm run start:prod`

---

## 🔒 CORS Configuration (Backend)

Make sure you allow cross-origin requests in your `main.ts` of NestJS:

```ts
app.enableCors({
  origin: ['https://todo-fb699.web.app'],
});
```

---

## 📸 Screenshots

| Desktop UI                        | Mobile Responsive                  |
|----------------------------------|------------------------------------|
| ![](./screenshots/desktop.png)  | ![](./screenshots/mobile.png)      |

---

## 🧠 Lessons Learned

- How to integrate Flutter Web with external APIs
- Using Firebase Hosting for static assets
- Deploying a NestJS backend to Render with CORS

---

## 📃 License

MIT

---

## 🙌 Credits

- Flutter team (awesome UI toolkit)
- NestJS team (powerful backend framework)
- Firebase & Render for free-tier hosting ❤️
