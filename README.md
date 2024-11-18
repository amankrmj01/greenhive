# Greenhouse Management System

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technical Stack](#technical-stack)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Contributing](#contributing)
- [License](#license)
- [Version](#version)

## Overview
The Greenhouse Management System is designed to monitor and control various environmental parameters within a greenhouse. This system allows users to manage devices such as fans, lights, and water pumps, and provides real-time updates through MQTT integration.

## Features
- **Greenhouse Management**: Monitor temperature, humidity, soil moisture, and light levels.
- **Device Controls**: Control fan, light, and water pump with ON, OFF, and AUTO modes.
- **Automated Water Pump**: Automatically turn off the water pump after 2 seconds.
- **MQTT Integration**: Publish and subscribe to MQTT topics for real-time updates and control.
- **Data Storage**: Store and retrieve certificates from DynamoDB for secure MQTT connections.
- **Deletion Functionality**: Delete current microcontroller and greenhouse data from the database.
- **UI Enhancements**: Custom scroll view, sliver app bar, and responsive design.

## Technical Stack
- **Languages**: Dart, Kotlin, Java, TypeScript, JavaScript
- **Frameworks**: Flutter
- **Tools**: Android Studio, Gradle, npm, pub
- **AWS Services**: AWS IOT Core, DynamoDB, Lambda, API Gateway, Cognito, IAM

## Setup Instructions
1. **Clone the Repository**:

   ```
   git clone https://github.com/amankrmj01/greenhive
   cd greenhive
   ```

2. **Install Dependencies**:
    - For Dart/Flutter:
      ```
      flutter pub get
      ```
    - For JavaScript/TypeScript:
      ```
      npm install
      ```

3. **Configure Environment Variables**:
   Create a `.env` file in the root directory and add the following variables:

   ```
   MQTT_ENDPOINT=<your-mqtt-endpoint>
   CLIENT_ID=<your-client-id>
   PUBLISH_TOPIC=<your-publish-topic>
   SUBSCRIBE_TOPIC=<your-subscribe-topic>
   CERT_PATH=<your-cert-path>
   PRIVATE_KEY_PATH=<your-private-key-path>
   ROOT_CA_PATH=<your-root-ca-path>
   ```

4. **Run the Application**:
    - For Flutter:
      ```
      flutter pub get
      flutter run
      ```

## Usage
- **Greenhouse Screen**: View and control the greenhouse environment.
- **Device Controls**: Use the dropdown menus to set the status of the fan, light, and water pump.
- **Delete Functionality**: Press the "Delete" button to remove the current microcontroller and greenhouse data.

## Code Structure
- `lib/infrastructure/dal/services/aws/aws_service.dart`: AWS service integration.
- `lib/presentation/green_house/green_house.screen.dart`: Greenhouse screen UI and logic.
- `session_service.dart`: Session management and authentication.

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License
This project is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License. See the LICENSE file for details.
[License](https://creativecommons.org/licenses/by-nc/4.0/)
[License](LICENSE.md)

##Version
- **Flutter Version**: 3.24.4 (Channel stable)
- **Dart Version**: 3.5.4
- **Android SDK Version**: 34.0.0
- **Java Version**: OpenJDK Runtime Environment (build 21.0.3+-12282718-b509.11)
- **Android Studio Version**: 2024.2

## Contact
For any inquiries or support, please contact [amankrmj@gmail.com].

## Screenshots
<img src="Screenshots\v1.3.0\Splash.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\Splash2.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\SignIn.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\SignUp.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\Home.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\AddGreenhouse.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="Screenshots\v1.3.0\GreenHouse.png" alt="Auth Screen" width="200" height="auto" />&nbsp;&nbsp;&nbsp;&nbsp;