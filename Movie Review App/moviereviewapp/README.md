# Movie Review App

A sleek and modern Flutter application for movie enthusiasts to discover, search, and track their favorite films. This project follows a clean, feature-driven architecture and uses modern state management practices.

## 🚀 Features

- **Discover Movies**: Browse trending and top-rated movies on the home screen.
- **Search**: Quickly find movies by title.
- **Movie Details**: View in-depth information about movies, including reviews and ratings.
- **Wishlist**: Save movies you're interested in for later viewing.
- **User Authentication**: Secure onboarding and login process (Firebase Auth, Splash, Login).
- **Profile Management**: View and manage your user profile, followers, and movies watched (Firestore).
- **Modern UI**: Clean design inspired by the [Cinephiler Figma Pack](https://www.figma.com/community/file/1389033578385188387/cinephiler-keep-track-and-log-movies-full-ui-pack).
- **Robust Networking**: Custom Network Caller to handle HTTP requests gracefully.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Backend as a Service (BaaS)**: [Firebase Authentication](https://firebase.google.com/docs/auth) & [Cloud Firestore](https://firebase.google.com/docs/firestore)
- **API**: [The Movie Database (TMDB)](https://developer.themoviedb.org/)
- **Networking**: [http](https://pub.dev/packages/http) with Custom Network Caller
- **Logging**: [logger](https://pub.dev/packages/logger)
- **Icons**: [Hugeicons](https://pub.dev/packages/hugeicons)
- **Environment Variables**: [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **Fonts**: Poppins (Custom)

## 📦 Project Structure

The project is organized into features for scalability and maintainability:

```text
lib/
├── app/          # Global configuration (Theme, Routes, App Widget, Network Caller Config)
├── core/         # Shared utilities, constants, app strings, and assets
├── data/         # Data layer (Network Caller, Network Response, Repositories)
├── domain/       # Domain layer (Entities, Use Cases)
└── features/     # Feature-specific modules
    ├── auth/         # Login, Splash, Auth Provider (Firebase)
    ├── Home/         # Home screen and movie lists, App Drawer
    ├── movie_screen/ # Movie details and recently watched
    ├── search/       # Search functionality and Upcoming Movies
    ├── wishlist/     # Saved movies
    ├── profile/      # User profile settings
    ├── logger/       # App-wide logging setup
    └── shared/       # Common widgets (e.g., Movie Cards) and providers
```

## ⚙️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)
- Firebase Project Setup (Google-services.json / GoogleService-Info.plist)
- TMDB API Key (Get it from [TMDB](https://www.themoviedb.org/documentation/api))

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/moviereviewapp.git
    cd moviereviewapp
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Firebase Setup:**
    - Create a project on [Firebase Console](https://console.firebase.google.com/).
    - Enable Authentication (Email/Password) and Cloud Firestore.
    - Add Android/iOS apps in Firebase and download the respective config files (`google-services.json` for Android, `GoogleService-Info.plist` for iOS) and place them in the correct directories.

4.  **Environment Configuration:**
    - Create a `.env` file in the root directory.
    - Add your TMDB API credentials:
      ```env
      TMDB_API_KEY=your_api_key_here
      ```

5.  **Run the application:**
    ```bash
    flutter run
    ```

## 🎨 Design Reference
This app is based on the [Cinephiler UI Pack](https://www.figma.com/community/file/1389033578385188387) on Figma.

## 📄 License
This project is for educational purposes. All movie data is provided by [TMDB](https://www.themoviedb.org/).
