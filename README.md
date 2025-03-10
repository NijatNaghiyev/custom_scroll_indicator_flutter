# Custom Scroll Indicator for Contact List
This is a Flutter mobile application featuring a custom scroll indicator that dynamically displays the active letter while scrolling through a contact list. The letter corresponds to the section currently at the top of the scroll view.
## Features
- Custom vertical scroll bar with highlighted active letter
- Real-time active letter update as the user scrolls
- Beautiful and smooth scrolling animations
- Clean and simple UI design
## Demo
![Image](https://github.com/user-attachments/assets/e149b455-ca07-488b-8837-61ee740d0aa9)
![Image](https://github.com/user-attachments/assets/2c9e05e9-f205-428f-a4a0-7c4d13ec29de)

## Getting Started
### Prerequisites
- Flutter SDK (3.x.x or latest stable version)
- Dart (latest stable version)
### Installation
1. Clone the repository:
```bash
git clone https://github.com/your-username/custom-scroll-indicator.git
cd custom-scroll-indicator
```
2. Install dependencies:
```bash
flutter pub get
```
3. Run the app:
```bash
flutter run
```
## Project Structure
```
lib/
├── main.dart                       # Entry point of the application
├── data/
│   └── dummy_data.dart             # Sample contact data
├── helpers/
│   └── get_visible_percentage.dart # Helper for scroll calculations
├── mixins/
│   └── contact_screen_mixin.dart   # Shared functionality for contact screen
├── models/
│   └── contact_model.dart          # Contact data model
├── screen/
│   └── contact_screen.dart         # Main contact list screen
└── widgets/
    ├── contact_item.dart           # Individual contact list item
    ├── contact_screen_app_bar.dart # Custom app bar for the contact screen
    ├── contact_view.dart           # Contact list view implementation
    └── scroll_indicator.dart       # Custom scroll indicator implementation
```
## How It Works
- `contact_list.dart` builds a vertically scrolling list of contact cards grouped by their starting letter.
- `scroll_indicator.dart` tracks the scroll position and determines the current active letter.
- The active letter is displayed alongside the custom scroll bar and updates in real-time.

## Screenshots
![Image](https://github.com/user-attachments/assets/218f3499-8889-41f1-96fd-7e79e3e42b1d)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
## Contributing
Feel free to submit issues and pull requests! Any suggestions to improve this project are welcome.
---
**Author:** [Your Name](https://github.com/your-username)
