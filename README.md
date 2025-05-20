# ParkCaching

ParkCaching is a Flutter mobile application that combines geocaching principles with augmented reality (AR) to enhance the experience of exploring parks and public spaces. Users can discover hidden virtual objects by scanning QR codes placed in different locations and view 3D models in AR.

## Features

- **User Authentication**: Secure login and signup functionality using Firebase Authentication.
- **QR Code Scanning**: Built-in QR code scanner to discover hidden locations.
- **Augmented Reality**: View 3D models overlaid on the real world through your device's camera.
- **Cloud Storage**: Store and retrieve information about locations and AR objects using Firebase Firestore.

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase account
- Android Studio or Visual Studio Code
- Android device with ARCore support or iOS device with ARKit support

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/parkcaching.git
   ```

2. Navigate to the project directory:

   ```bash
   cd parkcaching
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

## Project Structure

```plaintext
lib/
├── firebase_options.dart - Firebase configuration
├── main.dart - Application entry point
└── screen/
    ├── ar_screen.dart - AR view for displaying 3D models
    ├── login.dart - User authentication screen
    ├── menu_screen.dart - Main menu navigation
    ├── qr_screen.dart - QR code scanning functionality
    ├── ready_for_ar.dart - Preparation for AR experience
    └── signup.dart - User registration screen
```

## Dependencies

- **Flutter**: UI toolkit for building natively compiled applications
- **Firebase Core**: Firebase services integration
- **Firebase Auth**: User authentication
- **Cloud Firestore**: NoSQL cloud database
- **QR Code Scanner**: QR code scanning functionality
- **Flutter Cube**: 3D model rendering
- **Camera**: Access to device camera for AR
- **Vector Math**: Mathematical operations for AR positioning

## How It Works

1. **User Authentication**: Users create an account or log in to access the app.
2. **Discovery**: Users navigate parks or public spaces to find QR codes.
3. **Scanning**: When a QR code is found, users scan it with the app.
4. **AR Experience**: The app fetches relevant information from Firestore and displays a 3D model in AR at the location.

## Future Enhancements

- User progress tracking
- Social features to share discoveries
- Gamification elements (points, badges, leaderboards)
- Custom AR object creation
- Map integration for navigation between points

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any inquiries or feedback, please contact [andres.martin1726@gmail.com](mailto:andres.martin1726@gmail.com).

