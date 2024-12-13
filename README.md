# **City Weather**

A Flutter application that provides real-time weather updates and forecasts for cities around the world, using the OpenWeatherMap API.

---

## **Features**
- Fetch current weather conditions for cities.
- View detailed weather forecasts.
- Offline support with cached data for previously fetched cities.
- Modern state management using **BLoC**.
- Follows **Clean Architecture** principles for maintainability and scalability.

---

## **Getting Started**

### **Prerequisites**
- **Flutter SDK**: Ensure you have Flutter installed. Refer to the [Flutter installation guide](https://docs.flutter.dev/get-started/install).
- **FVM**: (Optional) If using Flutter Version Management, install `fvm` via:

```bash
dart pub global activate fvm
```

### **Environment Configuration**

This project uses an .env file to store sensitive information like the API key. A .env.example file is provided as a template.

Steps to Configure:
1.	Create a new .env file in the root of the project:

```bash
cp .env.example .env
```

2.	Open .env and update the following fields with your configuration:

```env
API_KEY=your_openweathermap_api_key
BASE_URL=https://api.openweathermap.org/data/2.5/
```
  
- API_KEY: Obtain from OpenWeatherMap.
- BASE_URL: The API base URL (already provided).

3.	Ensure .env is not committed to version control. This is already handled by the .gitignore.

### **Testing**

Run tests to validate business logic and individual components:

```bash
flutter test
```

---

## **Architecture**

### **Clean Architecture**

This project follows Clean Architecture principles:
- Presentation Layer:
    - Widgets and UI components.
	- Uses BLoC for state management.
- Domain Layer:
	- Business logic and entities.
	- Contains Use Cases for executing business logic.
- Data Layer:
	- Handles API calls and data caching.
	- Includes repositories and data sources.

### **Tech Stack**
- Flutter: Frontend development.
- Dart: Programming language.
- BLoC: State management.
- GetIt: Dependency injection.
- Flutter Dotenv: Environment variable management.