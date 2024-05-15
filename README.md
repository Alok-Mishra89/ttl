# TTL

The Flutter MVC Architecture Project is an e-commerce mobile application designed to provide users with a seamless shopping experience. Built using the Model-View-Controller (MVC) architecture pattern, the app divides its functionality into three distinct components:

Model: Contains data models and business logic, facilitating efficient management of product information, user data, and other essential entities.

View: Consists of user interface components, including screens for browsing products, managing the shopping cart, logging in, and displaying a splash screen upon app launch.

Controller: Handles user input, interacts with the model to retrieve and manipulate data, and updates the view accordingly. The main.dart file serves as the controller, defining routes and initializing the application.

With a user-friendly interface and intuitive navigation, the app offers features such as:

Browsing products across various categories.
Adding items to the shopping cart.
Viewing and managing the contents of the shopping cart.
Logging in securely to access personalized features.
Displaying a visually appealing splash screen during app startup.
Developed using Flutter, the application ensures cross-platform compatibility and smooth performance across Android and iOS devices. Additionally, the adherence to MVC architecture enhances maintainability and scalability, allowing for future expansion and optimization of the app's functionality.

Overall, the Flutter MVC Architecture Project delivers a compelling e-commerce solution that prioritizes usability, efficiency, and code organization, offering users a delightful shopping experience while empowering developers with a structured and modular codebase.

# Flutter MVC Architecture Project

This Flutter project implements the Model-View-Controller (MVC) architecture pattern. MVC is a software design pattern commonly used for developing user interfaces that divides an application into three interconnected components: Model, View, and Controller.

## Project Structure

The project is structured into separate directories for each component of the MVC architecture:

- **Model**: The data models and business logic of the application.
- **View**: The user interface components of the application.
- **Controller**: The logic that handles user input, interacts with the model, and updates the view.

### Directory Structure

flutter_mvc_architecture/
│
├── lib/
│ ├── Model/
│ │ └── ()
│ ├── View/
│ │ ├── cart_page_view.dart
│ │ ├── home_page_view.dart
│ │ ├── login_page_view.dart
│ │ └── splash_screen_view.dart
│ ├── Controller/
│ │ └── main.dart
│ └── main.dart
│
├── pubspec.yaml
└── README.md

## Components

### Model

The Model directory contains data models and business logic. In this project, it might include classes representing products, user data, or any other application-specific entities.

### View

The View directory contains user interface components of the application. Each screen or page of the app has its own Dart file in this directory, such as the home page, cart page, login page, and splash screen.

### Controller

The Controller directory contains the logic that handles user input, interacts with the model, and updates the view. In this project, the main.dart file serves as the controller, defining routes and initializing the app.

## Usage

To run the project, ensure you have Flutter installed and set up on your development environment. Clone this repository and navigate to the project directory. Run the following command:

```bash
flutter run


