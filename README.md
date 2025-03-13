
# Rick and Morty Character Finder

This is a Flutter application that allows users to search for and browse characters from the **Rick and Morty** universe. The app fetches character data from the [Rick and Morty API](https://rickandmortyapi.com/) and displays it in a user-friendly grid format with infinite scrolling and search functionality.

## Features

-   🌟 **Browse Characters** – View all characters from the Rick and Morty universe.
-   🔍 **Search Functionality** – Search characters by name in real-time.
-   📜 **Infinite Scrolling** – Automatically loads more characters as you scroll.
-   🖼️ **Character Details** – Displays character images, names, and genders.
-   🚀 **Responsive UI** – Adapts to different screen sizes.

## Installation

### Prerequisites

-   Flutter SDK installed ([Install Flutter](https://flutter.dev/docs/get-started/install))
-   Dart installed (included with Flutter)

### Steps

1.  Clone the repository:
    
    ```sh
    git clone https://github.com/YehorChervonyi/Rick-and-Morty-Docs
    cd Rick-and-Morty-Docs
    
    ```
    
2.  Install dependencies:
    
    ```sh
    flutter pub get
    
    ```
    
3.  Run the app:
    
    ```sh
    flutter run
    
    ```
    

## Project Structure

```
lib/
├── controllers/          # Business logic and API calls
│   ├── character_controller.dart
├── models/              # Data models
│   ├── character_model.dart
├── views/               # UI screens
│   ├── character_view.dart
├── widgets/             # Reusable UI components
│   ├── character_card_widget.dart
├── main.dart            # App entry point

```

## API Integration

The app retrieves character data from the [Rick and Morty API](https://rickandmortyapi.com/).

-   **Get all characters:** `https://rickandmortyapi.com/api/character?page=1`
-   **Search characters by name:** `https://rickandmortyapi.com/api/character/?name=rick`

## Dependencies

The app uses the following Flutter packages:

-   `http` – For API requests
-   `provider` – State management (optional)
-   `flutter_spinkit` – For loading indicators

----------

### 📌 **Author**

Developed by **[Yehor Chervonyi]** – [GitHub](https://github.com/YehorChervonyi)
