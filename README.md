# User Management System

A full-stack user management application built with Node.js, MongoDB, and Flutter. This application provides complete CRUD (Create, Read, Update, Delete) functionality for managing user profiles with a clean and intuitive interface.

## 🚀 Features

- **Create User Profiles**: Add new users with name, email, and profile image
- **View User Profiles**: Display user information with profile images
- **Update User Profiles**: Edit existing user information
- **Delete User Profiles**: Remove users from the system
- **Real-time Data Refresh**: Instant updates with pull-to-refresh functionality
- **Responsive UI**: Clean and modern Flutter interface
- **RESTful API**: Well-structured backend API endpoints

## 🛠️ Tech Stack

### Backend
- **Node.js**: Runtime environment
- **Express.js**: Web framework
- **MongoDB**: NoSQL database
- **Mongoose**: MongoDB object modeling
- **CORS**: Cross-origin resource sharing

### Frontend
- **Flutter**: Cross-platform mobile framework
- **Dart**: Programming language
- **HTTP**: API communication
- **Material Design**: UI components

## 📁 Project Structure

```
├── backend/
│   ├── models/
│   │   └── user.js          # User model schema
│   └── server.js            # Main server file
├── frontend/
│   ├── lib/
│   │   ├── APIs/
│   │   │   └── api.dart     # API service class
│   │   └── main.dart        # Main Flutter application
└── README.md
```

## 🔧 Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (local instance)
- Flutter SDK
- Dart SDK

### Backend Setup

1. **Clone the repository**
   ```bash
   git clone REST-API-using-Node-js-and-MongoDB
   cd backend
   ```

2. **Install backend dependencies**
   ```bash
   npm install express mongoose cors
   ```

3. **Start MongoDB**
   ```bash
   # For local MongoDB installation
   mongod
   ```

4. **Run the backend server**
   ```bash
   node server.js
   ```
   
   The server will start on `http://localhost:3000`

### Frontend Setup

1. **Navigate to frontend directory**
   ```bash
   cd frontend
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Update API base URL**
   
   In `lib/APIs/api.dart`, update the `basePath` variable with your server IP:
   ```dart
   final basePath = 'http://localhost:3000';
   ```

4. **Run the Flutter application**
   ```bash
   flutter run
   ```

## 🌐 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Health check |
| GET | `/read` | Get all users |
| POST | `/create` | Create a new user |
| PUT | `/update/:id` | Update user by ID |
| DELETE | `/delete/:id` | Delete user by ID |

### API Request/Response Examples

#### Create User
**POST** `/create`
```json
{
  "name": "John Doe",
  "email": "john.doe@example.com",
  "imageUrl": "https://example.com/profile.jpg"
}
```

#### Update User
**PUT** `/update/:id`
```json
{
  "name": "arslan raza",
  "email": "arslan.raza@example.com",
  "imageUrl": "https://example.com/new-profile.jpg"
}
```

## 📱 App Screenshots

The Flutter application features:
- Clean input forms for user data
- Profile card display with image
- Edit and Delete functionality
- Refresh button for data synchronization

## 🔒 Database Schema

### User Model
```javascript
{
  name: String,      // User's full name
  email: String,     // User's email address
  imageUrl: String   // Profile image URL
}
```

## 🚀 Deployment

### Backend Deployment
1. Deploy to platforms like Heroku, Vercel, or DigitalOcean
2. Update MongoDB connection string for production
3. Set environment variables for sensitive data

### Frontend Deployment
1. Build the Flutter app: `flutter build apk` (Android) or `flutter build ios` (iOS)
2. Deploy to Google Play Store or Apple App Store
3. Update API endpoints to production URLs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 👨‍💻 Author

**Arslan Raza**
- GitHub: [arslanraza143](https://github.com/arslanraza143)
- Email: arslanraza2022@gmail.com

## 🐛 Issues

If you encounter any issues, please report them [here](https://github.com/arslanraza143/REST-API-using-Node-js-and-MongoDB/issues).

## 📞 Support

For support and questions, please contact [arslanraza2022@gmail.com](mailto:arslanraza2022@gmail.com).

---

⭐ **Star this repository if you found it helpful!**
