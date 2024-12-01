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

<img src="https://github.com/user-attachments/assets/dd8ccb92-77d4-43aa-b0b4-8a0a9336e066" alt="Simulator Screenshot 1" width="300">

<img src="https://github.com/user-attachments/assets/c2ef0e9a-747d-48c8-874b-3f6bbd63638d" alt="Simulator Screenshot 2" width="300">

## 🛠 Tech Stack

- **Flutter**: For building the UI and app logic.
- **Provider**: State management to handle task-related operations efficiently.
- **Material & Cupertino**: Widgets for cross-platform compatibility.
- **Flutter Slidable**: For implementing swipe-to-delete functionality.

## 📋 Installation

To run Tasky locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/PrpCena/tasky
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
