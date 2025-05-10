# BHARAT_NXT_ARTICLE_APP
# Flutter Article App
A Flutter app that fetches and displays a list of articles from a public
API.
## Features
- List of articles
- Search functionality
- Detail view
- Responsive UI
- Favourite Article
## Setup Instructions
1. Clone the repo:
git clone "https://github.com/patilrahu/BHARAT_NXT_ARTICLE_APP.git"
2. Install dependencies:
flutter pub get
3. Run the app:
flutter run
## Tech Stack
- Flutter SDK: 3.24.4
- State Management: GetX
- HTTP Client: dio
- Persistence: shared_preferences
## State Management Explanation
[Write 2-3 sentences about your choice and data flow]
I chose GetX for state management because it's easy to set up and requires minimal boilerplate code. Using the Obx widget, it allows real-time UI updates whenever the underlying observable data changes.
Data Flow : 
GetMaterialApp -> Add Class Extend GetX Controller -> Assin Value Rx Bool or any data Type -> Listen Data value Change Real Time Obx
## Known Issues / Limitations
No

