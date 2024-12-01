# Tasky

Tasky is a simple, intuitive, and visually appealing task management app. It allows users to seamlessly create, manage, and organize their tasks with ease. Designed for efficiency and simplicity, Tasky makes staying on top of your to-do list effortless.

## ✨ Features

- **Create Tasks**: Add new tasks with a single tap.
- **Edit Mode**: Double-tap a task to edit its title.
- **Task Completion**: Mark tasks as done with a single tap.
- **Task Deletion**: Swipe to delete unwanted tasks.
- **Dynamic Task Counter**: View the total number of tasks updated in real-time.
- **Sleek Design**: Modern and user-friendly interface with custom themes.

## 🚀 Screenshots

Here are some screenshots of the app:

| Home Screen | Adding Tasks | Task Management |
|-------------|--------------|-----------------|
| ![Home Screen](./screenshots/screenshot1.png) | ![Adding Tasks](./screenshots/screenshot2.png) | ![Task Management](./screenshots/screenshot3.png) |


## 🛠 Tech Stack

- **Flutter**: For building the UI and app logic.
- **Provider**: State management to handle task-related operations efficiently.
- **Material & Cupertino**: Widgets for cross-platform compatibility.
- **Flutter Slidable**: For implem![Simulator Screenshot - iPhone Xʀ - 2024-12-01 at 14 44 40](https://github.com/user-attachments/assets/f3827fe1-3ff0-44c7-a321-c3dcdb755494)
enting swipe-to-delete functionality.

## 📋 Installation

To run Tasky locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/tasky.git
   cd tasky
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

Make sure you have Flutter installed and configured on your system. Refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install) for installation instructions.

## 🖌 Theme Colors

Tasky uses a custom color palette to provide a visually appealing interface:

```dart
class AppColors {
  static const primary = Color(0xFF4CAF50);
  static const accent = Color(0xFFFAFAFA);
  static const iconForeground = Color(0xFFFFFFFF);
  static const iconBackground = Color(0xFF4CAF50);
  static const secondaryBackground = Color(0xFFFFFFFF);
  static const circleAvatarBackground = Color(0xFF4CAF50);
  static const headerText = Color(0xFF212121);
  static const taskCountText = Color(0xFF757575);
  static const taskText = Color(0xFF212121);
  static const completedTaskText = Color(0xFF9E9E9E);
  static const taskCardBackground = Color(0xFFEEEEEE);
  static const border = Color(0xFFBDBDBD);
}
```


## 🤝 Contribution

Contributions, issues, and feature requests are welcome!  
Feel free to check the [issues page](https://github.com/PrpCena/tasky) or create a pull request.

---

Let me know if you’d like to tweak or add anything! 😊
