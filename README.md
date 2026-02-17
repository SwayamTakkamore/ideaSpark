# IdeaSpark

**IdeaSpark** is a full-stack innovation platform that empowers students to submit and showcase their ideas, connect with mentors for guidance, and collaborate on projects. The platform features an AI-powered chatbot, idea verification system, leaderboard with XP tracking, and multi-platform support (Web & Android).

---

## 🚀 Features

### For Students
- **Idea Submission**: Submit innovative ideas with detailed descriptions, domain categorization, tags, and PDF attachments
- **Mentor Discovery**: Browse and connect with experienced mentors based on their expertise
- **Pitch System**: Present ideas to mentors and receive valuable feedback
- **User Profile**: Track submitted ideas, XP points, and achievements
- **IdeaBot**: AI-powered assistant to help brainstorm and refine ideas
- **Leaderboard**: Compete with peers based on XP and contributions

### For Mentors
- **Review Pitches**: Evaluate student ideas and provide constructive feedback
- **Accept/Reject Proposals**: Manage incoming pitch requests
- **Expertise Showcase**: Display areas of expertise to attract relevant ideas

### For Admins
- **Idea Verification**: Review and verify submitted ideas for quality
- **User Management**: Oversee platform users and their activities
- **Content Moderation**: Maintain platform standards

---

## 🛠️ Tech Stack

### Backend
- **Node.js** & **Express.js** - REST API server
- **MongoDB** & **Mongoose** - Database and ODM
- **JWT** & **bcryptjs** - Authentication and password encryption
- **Multer** - File upload handling
- **express-session** - Session management
- **CORS** - Cross-origin resource sharing

### Web Frontend
- **React 19** - UI library
- **Vite** - Build tool and dev server
- **React Router** - Client-side routing
- **Axios** - HTTP client
- **Framer Motion** - Animation library
- **React Markdown** - Markdown rendering for IdeaBot

### Android App
- **Flutter 3.7+** - Cross-platform mobile framework
- **Dart** - Programming language
- **http** - HTTP requests
- **shared_preferences** - Local data storage
- **flutter_svg** - SVG rendering
- **file_picker** - File selection
- **flutter_markdown** - Markdown rendering

---

## 📁 Project Structure

```
Ideaspark/
├── backend/              # Node.js Express API
│   ├── server.js         # Main server file
│   ├── middleware/       # Authentication middleware
│   ├── .env.example      # Environment variables template
│   └── package.json
│
├── web/                  # React Web Application
│   ├── src/
│   │   ├── components/   # Reusable UI components
│   │   │   ├── IdeaBot.jsx
│   │   │   ├── Leaderboard.jsx
│   │   │   └── Navbar.jsx
│   │   ├── styles/       # CSS stylesheets
│   │   ├── api/          # API integration
│   │   ├── App.jsx       # Main app component
│   │   └── main.jsx      # Entry point
│   ├── package.json
│   └── vite.config.js
│
└── Android/              # Flutter Mobile App
    ├── lib/              # Dart source files
    │   ├── main.dart     # App entry point
    │   ├── dashboard.dart
    │   ├── login.dart
    │   ├── register.dart
    │   ├── idea_submit.dart
    │   ├── ideabot.dart
    │   ├── mentors.dart
    │   ├── profile.dart
    │   └── leaderboard.dart
    ├── assets/           # Images and icons
    ├── pubspec.yaml      # Flutter dependencies
    └── android/          # Android-specific files
```

---

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Node.js** (v16 or higher)
- **npm** or **yarn**
- **MongoDB** (local instance or MongoDB Atlas account)
- **Flutter SDK** (3.7 or higher) - for Android app
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**

---

## 🔧 Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/Ideaspark.git
cd Ideaspark
```

### 2. Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create environment file
cp .env.example .env

# Edit .env and add your MongoDB URI and JWT secret
# MONGO_URI="mongodb+srv://<username>:<password>@cluster.mongodb.net/ideaspark"
# JWT_SECRET="your-secret-key"
# PORT=5000

# Start the server
npm start

# Or use nodemon for development
npm run dev
```

The backend server will run on `http://localhost:5000`

### 3. Web Frontend Setup

```bash
cd ../web

# Install dependencies
npm install

# Start development server
npm run dev
```

The web app will run on `http://localhost:5173` (default Vite port)

### 4. Android App Setup

```bash
cd ../Android

# Install Flutter dependencies
flutter pub get

# Run the app (ensure emulator/device is connected)
flutter run

# Or build APK
flutter build apk
```

---

## 🔐 Environment Variables

### Backend (.env)

```env
MONGO_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/ideaspark
JWT_SECRET=your-super-secret-jwt-key
PORT=5000
```

### Web Frontend

Update API endpoints in relevant files if backend is not on `localhost:5000`

### Android App

Update the API base URL in [fetch_ip.dart](Android/lib/fetch_ip.dart) to match your backend server IP

---

## 🌐 API Endpoints

### Authentication
- `POST /register` - Register new user (student/mentor/admin)
- `POST /login` - User login
- `POST /logout` - User logout

### Ideas
- `GET /ideas` - Get all ideas
- `POST /ideas` - Submit new idea (with file upload)
- `PUT /ideas/:id/verify` - Verify idea (admin)
- `PUT /ideas/:id/not-verify` - Reset idea to pending
- `DELETE /ideas/:id` - Delete idea

### User Management
- `POST /user-profile` - Get user profile and ideas
- `POST /user-role` - Get user role
- `GET /users` - Get all users (sorted by XP)
- `GET /mentors` - Get list of mentors

### Pitching
- `POST /pitch` - Pitch idea to mentor
- `PUT /pitch/:id` - Accept/reject pitch (mentor)

---

## 🎨 User Roles

1. **Student**: Can submit ideas, pitch to mentors, view profile, earn XP
2. **Mentor**: Can review pitches, provide feedback, showcase expertise
3. **Admin**: Can verify ideas, manage users, moderate content

---

## 📱 Screens & Features

### Web Application
- **Home Page**: Live stats, featured ideas
- **Login/Register**: User authentication
- **Idea Submission**: Form to submit new ideas with PDF upload
- **Find Mentor**: Browse mentors by expertise
- **User Profile**: Personal dashboard with submitted ideas
- **Idea Verification**: Admin panel for reviewing ideas
- **IdeaBot**: AI chatbot for idea assistance
- **Leaderboard**: XP-based ranking system
- **Accept Pitch**: Mentor dashboard for pitch management

### Android Application
- All web features available on mobile
- Native Android UI with Material Design
- Offline capability with local storage
- File picking for PDF uploads
- Responsive Flutter widgets

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 🐛 Known Issues

- IdeaBot API endpoint needs to be configured (currently pointing to placeholder IP)
- Session management could be enhanced with Redis
- File upload directory needs proper configuration for production

---

## 🔮 Future Enhancements

- [ ] Real-time notifications for pitch responses
- [ ] Video call integration for mentor-student meetings
- [ ] Advanced search and filtering for ideas
- [ ] Collaboration features for team projects
- [ ] Achievement badges and rewards system
- [ ] Integration with GitHub for code repositories
- [ ] Email notifications
- [ ] Dark mode support

---

## 📄 License

This project is licensed under the MIT License.

---

## 👥 Team

Developed for RTH2025 Hackathon

---

## 📞 Support

For issues and questions, please open an issue on GitHub or contact the development team.

---

## 🎯 Quick Start Commands

```bash
# Start Backend
cd backend && npm install && npm start

# Start Web Frontend
cd web && npm install && npm run dev

# Start Android App
cd Android && flutter pub get && flutter run
```

---

**Happy Innovating! 🚀**
