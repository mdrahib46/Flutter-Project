# 🍔 Food Delivery App

A feature-rich, modern Food Delivery Mobile Application built with **Flutter** and **Provider** state management. Designed with a clean, feature-driven architecture following UI/UX designs from Figma.

---

## 🌟 Key Features

### 🚀 Onboarding & Splash
- **Splash Screen:** Animated brand entry with logo and background artwork.
- **Interactive Onboarding Carousel:** 3-page walkthrough with auto-sliding timers (`OnboardingProvider`), animated page indicator dots, and interactive "Skip" / "Get Started" buttons.

### 🔐 Authentication Flow
- **Login Screen:** Email & password authentication with password visibility toggle, "Remember Me" checkbox, and social logins (Facebook, Twitter/X, Apple).
- **Sign Up Screen:** User registration with password & confirmation password validation controls.
- **Forgot Password & OTP Verification:** Password recovery flow with a 4-digit PIN entry box using `pin_code_fields`, accompanied by a live 10-second OTP resend countdown timer (`AuthProvider`).
- **Reset Password:** Password update screen.

### 🏠 Home & Discovery
- **Delivery Address Header:** Custom AppBar displaying active location (`DELIVER TO Halal lab office`) with interactive dropdown and quick-access food cart button.
- **Search Bar:** Instant search input for dishes and restaurants.
- **Food Categories Slider:** Horizontal scrollable category cards (Pizza, Burger, Fried Chicken, Pasta, Sandwich, Coffee, Ice Cream, Biriyani, Seafood, Dessert).
- **Open Restaurants List:** Cards featuring restaurant thumbnails, menu highlights, ratings (`⭐ 4.7`), delivery fees (`Free`), and estimated delivery times (`20 min`).

### 🍕 Category & Food Items (`ItemScreen`)
- Filterable dish screens with dynamic dropdown selectors.
- Grid layout displaying dish images, titles, restaurant branding, pricing, and quick-add (`+`) cart action buttons.

### 🏪 Restaurant Detailed View (`RestaurantViewScreen`)
- **Image Carousel:** High-resolution restaurant image banner slider powered by `carousel_slider`.
- **Interactive Filter Modal:** Filter dialog supporting Offer types (*Delivery, Pick Up, Online Payment*) and Delivery Speed filters (*15-20 min, 20 min, 30 min*).
- **Choice Chips Menu Navigation:** Smooth horizontally scrollable category selection chips.
- **Menu Grid:** Responsive grid showcasing available dishes.

---

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev) (Dart SDK `^3.10.4`)
- **State Management:** [Provider](https://pub.dev/packages/provider) (`^6.1.5+1`)
- **Carousel Slider:** [carousel_slider](https://pub.dev/packages/carousel_slider) (`^5.1.2`)
- **PIN Code Input:** [pin_code_fields](https://pub.dev/packages/pin_code_fields) (`^9.3.0`)
- **Icons:** [Cupertino Icons](https://pub.dev/packages/cupertino_icons) & Material Icons
- **Design Reference:** [Figma Community Food Delivery App Design](https://www.figma.com/design/j8MRgCBeBKYNC1NkAGGX5e/Food-Delivery-App--Community-?node-id=601-477&t=aoHQw4NrX2xtrNtG-0)

---

## 📂 Project Structure

The project follows a clean **feature-driven folder architecture**:

```
lib/
├── main.dart                      # Application entry point with MultiProvider setup
├── my_app.dart                    # MaterialApp config, global themes, & route manager
├── models/                        # Data models
│   ├── category_model.dart        # Food category model
│   └── restaurant_model.dart      # Restaurant data model
├── provider/                      # State management classes
│   ├──  onBoardingProvider.dart   # Onboarding timer, page index, and auto-slide controller
│   └── auth_provider.dart         # Authentication state, password toggle, OTP timer
├── utils/                         # Constants & styling
│   ├── app_colors.dart            # Centralized color palette
│   ├── app_strings.dart           # Static app text strings
│   ├── app_text_style.dart        # Typography styles
│   ├── image_path.dart            # Asset image path references
│   └── restaurent_and_item_list.dart # Mock data sources
└── features/                      # Feature modules
    ├── common/
    │   └── widgets/               # Shared reusable widgets
    │       ├── app_action__btn.dart
    │       ├── custom_app_bard.dart
    │       ├── food_card_icon_widget.dart
    │       ├── food_card_widget.dart
    │       ├── restaurantCard.dart
    │       └── segment_title_widget.dart
    └── screens/
        ├── onboardings/           # Splash & Onboarding screens
        ├── auth_screen/           # Auth screens (Login, Signup, Forgot Pass, OTP, Reset Pass)
        ├── home_screen/           # Main Home Screen & Category widgets
        ├── item_screen/           # Specific category/item listing screen
        ├── restaurent_view/       # Detailed Restaurant view with filter modal
        └── food_details/          # Individual food item detail screen
```

---

## 📱 App Navigation Flow

```
Splash Screen
  └── Onboarding Screen (3 slides with auto-slide & skip)
        └── Login Screen
              ├── Sign Up Screen
              ├── Forgot Password Screen
              │     └── OTP Verification Screen (with countdown timer)
              │           └── Reset Password Screen
              └── Home Screen
                    ├── Item Screen (Category View)
                    └── Restaurant View Screen
                          └── Filter Modal (Dialog)
```

---

## 🚦 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.10.4`)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio / VS Code with Flutter extension
- An Android Emulator, iOS Simulator, or physical device

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/food.git
   cd food
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🗺️ Roadmap & Future Improvements

- [ ] **Backend Integration:** Connect REST API or Firebase for dynamic authentication and live database query.
- [ ] **Shopping Cart Management:** State management provider for adding/removing items, quantity adjustment, and total cost calculation.
- [ ] **Payment Gateway:** Integration with Stripe / SSLCommerz / Razorpay for checkout processing.
- [ ] **Live Order Tracking:** Google Maps API integration for real-time driver & delivery status tracking.
- [ ] **Dark Mode Support:** Theme toggle between light and dark modes.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
