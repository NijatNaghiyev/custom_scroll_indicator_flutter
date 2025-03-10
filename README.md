I'll update only the Project Structure section while keeping the rest of the README exactly as you've provided:

Here's your README with only the Project Structure section updated:

# Custom Scroll Indicator for Contact List
This is a Flutter mobile application featuring a custom scroll indicator that dynamically displays the active letter while scrolling through a contact list. The letter corresponds to the section currently at the top of the scroll view.
## Features
- Custom vertical scroll bar with highlighted active letter
- Real-time active letter update as the user scrolls
- Beautiful and smooth scrolling animations
- Clean and simple UI design
## Demo
![Scroll Indicator Demo](./Screen%20Recording%202025-03-10%20at%2023.32.53.gif)
![Another Demo](./Screen%20Recording%202025-03-10%20at%2023.22.05.gif)
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
![Contact List Screenshot](./Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-03-10%20at%2023.29.31%202.jpeg)
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
## Contributing
Feel free to submit issues and pull requests! Any suggestions to improve this project are welcome.
---
**Author:** [Your Name](https://github.com/your-username)
