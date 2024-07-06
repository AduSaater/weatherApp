# weatherapp

This is a simple Flutter weather application that displays current weather information for a given city using the OpenWeatherMap API.

## Features
1. **Home Screen**:
    - Search bar to enter a city name
    - Button to trigger the weather search
    - Loading indicator while fetching data

2. **Weather Details Screen**:
    - City name
    - Current temperature (in Celsius)
    - Weather condition (e.g., cloudy, sunny, rainy)
    - An icon representing the weather condition
    - Humidity percentage
    - Wind speed
    - Refresh button to fetch updated weather data

3. **Error Handling**:
    - Displays user-friendly error messages for API request failures

4. **State Management**:
    - Uses Provider for state management

5. **Responsive Design**:
    - Works on both mobile and tablet devices

6. **Data Persistence**:
    - Saves the last searched city
## Installation

1. Clone the repository
    ```bash
    git clone https://github.com/AduSaater/weatherApp.git
    cd weather_app
    ```

2. Install dependencies
    ```bash
    flutter pub get
    ```

3. Obtain an API key from [OpenWeatherMap](https://openweathermap.org/api) and add it to the `lib/constants/strings.dart` file
    ```dart
    const String apiKey = 'YOUR_API_KEY';
    ```

4. Run the app
    ```bash
    flutter run
    ```

## Folder Structure
```plaintext
lib/
|- constants/
|  |- colors.dart
|  |- strings.dart
|- models/
|  |- weather_model.dart
|- providers/
|  |- weather_provider.dart
|- screens/
|  |- home_screen.dart
|  |- weather_details_screen.dart
|- services/
|  |- weather_service.dart
|- main.dart