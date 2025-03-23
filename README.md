# SpoonFood Flutter App

# SpoonFood Flutter App

SpoonFood is a mobile application built with Flutter, designed to serve as a comprehensive online recipe book. Users can explore and discover a vast collection of recipes from around the globe, leveraging the Spoonacular API to provide a rich and diverse culinary experience.

## Table of Contents

- [Project Overview](#project-overview)
- [Key Features](#key-features)
- [Technical Highlights](#technical-highlights)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
  - [Login](#login-credientils)
- [Project Architecture](#project-architecture)
- [Dependencies](#dependencies)
- [Firebase Integration](#firebase-integration)
- [Spoonacular API Integration](#spoonacular-api-integration)
- [Potential Future Enhancements](#potential-future-enhancements)

## Project Overview

SpoonFood aims to simplify the process of discovering and preparing diverse recipes. This application provides users with a user-friendly interface to browse, search, and save recipes from various cuisines, all powered by the TheMealDB API. The focus is on creating a seamless and enjoyable cooking experience, encouraging users to explore new culinary horizons.

## Key Features

-   **Global Recipe Discovery:** Access a wide range of recipes from different countries and cultures, sourced via the Spoonacular API.
-   **User Registration & Authentication:** Secure user registration via email or phone, along with OTP verification, leveraging Firebase Authentication.
-   **Personalized Recipe Book:** Users can save their favorite recipes for easy access using shared preference.
-   **Robust Search Functionality:** Quickly find recipes based on ingredients, cuisine, or dietary requirements, utilizing TheMealDB API's search capabilities.
-   **User-Friendly Interface:** Intuitive design for easy navigation and recipe browsing.
-   **Snackbar messages:** Shows user feedback after actions like successful registration.
-   **Navigation:** Seamless navigation to login page after registration.
-   **Google Sign-In:** Easy login using google sign-in.
-   **Image upload:** users can upload images using firebase storage.

## Technical Highlights

-   **Flutter Framework:** Cross-platform mobile development using Flutter for a single codebase, targeting Android.
-   **Firebase Backend:** Integration with Firebase for user authentication (FirebaseAuth), data storage (Cloud Firestore), and image storage.
-   **State Management:** Implementation of **Provider** for efficient data flow and UI updates.
-   **Network Library:** Utilization of **http** for efficient handling of network requests to the Spoonacular API.
-   **Image Handling:** Using **cached_network_image** for efficient loading and caching of network images.
-   **Responsive Design:** Adaptive UI design to ensure optimal viewing on various screen sizes.
-   **Asynchronous Programming:** Utilization of `async` and `await` for efficient handling of network requests and data retrieval.

## Getting Started

### Prerequisites

-   Flutter SDK
-   Android Studio
-   Firebase CLI (if using Firebase)
-   Git

### Installation

1.  Clone the repository:

    ```bash
    git clone [repository URL]
    cd soopfood
    ```

2.  Install dependencies:

    ```bash
    flutter pub get
    ```

### Running the App

1.  Connect an Android device or start an emulator.
2.  Run the app:

    ```bash
    flutter run
    ```
##Login Credientials

   If you want to don't want to create an account
   email: demo@gmail.com
   password: Demo@12345

## Project Architecture
```
└── 📁lib
    └── 📁models
        └── category.dart
        └── recipe.dart
    └── 📁provider
        └── category_provider.dart
        └── cuisine_list_provider.dart
        └── favorite_recipes_provider.dart
        └── latest_recipe_provider.dart
        └── loading_provider.dart
        └── meal_of_day_provider.dart
        └── random_meal_provider.dart
        └── recently_viewed_recipes_provider.dart
        └── recipe_provider.dart
        └── recommended_recipe_provider.dart
    └── 📁screens
        └── 📁home_screen_content
            └── home_screen_content.dart
        └── 📁login_screen
            └── forgot_password_screen.dart
            └── login_screen.dart
            └── verify_Phone_Otp_Screen.dart
        └── 📁navigation_bar_screen
            └── categories_screen.dart
            └── favorites_screen.dart
            └── home_screen.dart
            └── profile_screen.dart
        └── 📁profile
            └── profile_anonymous_message.dart
            └── profile_dark_mode.dart
            └── profile_email_login_screen.dart
            └── profile_email.dart
            └── profile_image.dart
            └── profile_logout_button.dart
            └── profile_phone_login_screen.dart
            └── profile_phone.dart
            └── profile_screen.dart
        └── 📁register_screen
            └── register_screen.dart
        └── 📁sub_screen
            └── cuisine_recipes_screen.dart
            └── filtered_recipes_screen.dart
            └── floating_search_button.dart
            └── latest_recipes_screen.dart
            └── recipe_details_screen.dart
            └── search_results_screen.dart
    └── 📁services
        └── auth_service.dart
        └── profile_service.dart
        └── spoonfood_service.dart
    └── 📁shimmers
        └── categories_screen_shimmer.dart
        └── categories_widget_shimmer.dart
        └── cuisine_list_shimmer.dart
        └── cuisine_recipes_screen_shimmer.dart
        └── favorites_screen_shimmer.dart
        └── filtered_recipes_screen_shimmer.dart
        └── latest_recipes_shimmer.dart
        └── meal_of_day_shimmer.dart
        └── random_meal_shimmer.dart
        └── recent_search_shimmer.dart
        └── recently_viewed_recipes_shimmer.dart
        └── recipe_details_screen_shimmer.dart
        └── recommended_recipes_shimmer.dart
        └── shimmer_loading.dart
    └── 📁utils
        └── email_verification_utils.dart
        └── image_utils.dart
    └── 📁widgets
        └── 📁home_widgets
            └── categories_widget.dart
            └── category_indicator.dart
            └── cuisine_list.dart
            └── meal_of_the_day_widget.dart
            └── random_meal_widget.dart
            └── recently_viewed_recipes_widget.dart
            └── recipe_card.dart
            └── recommended_recipes_widget.dart
        └── loading_widget.dart
        └── 📁login_widget
            └── alternative_login_options.dart
            └── email_login_form.dart
            └── login_header.dart
            └── phone_login_form.dart
        └── 📁register_widget
            └── email_register_form.dart
            └── phone_register_form.dart
    └── 📁wrappers
        └── auth_wrapper.dart
    └── dustbinfile
    └── firebase_options.dart
    └── main.dart
    └── theme.dart
```
```
└── 📁assets
    └── 📁animations
        └── loading.json
        └── loading.lottie
    └── 📁fonts
        └── Poppins-Bold.ttf
        └── Poppins-Regular.ttf
        └── Poppins-SemiBold.ttf
    └── 📁icons
        └── non_veg.svg
        └── veg.svg
        └── vegan.svg
    └── 📁images
        └── logo.png
```

## Dependencies

-   `flutter`
-   `http`
-   `cached_network_image`
-   `provider`
-   `card_swiper`
-   `flutter_svg`
-   `shared_preferences`
-   `flutter_staggered_grid_view`
-   `uuid`
-   `firebase_core`
-   `firebase_auth`
-   `google_sign_in`
-   `cloud_firestore`
-   `lottie`
-   `image_picker`
-   `firebase_storage`

## Firebase Integration

-   Firebase Authentication for user registration and login.
-   Firebase setup includes `google-services.json` configuration for Android.

## TheMealDB API Integration

-   Integration with the TheMealDB API to fetch and display a wide range of recipes.
-   Utilizes API endpoints for recipe search, retrieval, and image loading.
-   Handles API key management and error handling for robust data fetching.

## Potential Future Enhancements

-   Implement recipe rating and review system.
-   Add user-generated recipe submissions.
-   Implement offline recipe access.
-   Add a shopping list feature based on recipe ingredients.
