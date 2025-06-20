# Flutter GestureDetector Demo 📱

A comprehensive Flutter application demonstrating various gesture recognition capabilities using GestureDetector widget. This app showcases tap, long press, drag, scale, and multi-gesture interactions with visual feedback and smooth animations.

## 🎯 Features

- **Tap Gestures**: Single tap and double tap detection
- **Long Press**: Long press start, hold, and end detection
- **Drag/Pan**: Draggable containers with position tracking
- **Scale & Rotate**: Pinch-to-zoom and rotation gestures
- **Multi-Gesture**: Combined gesture handling on single containers
- **Visual Feedback**: Color changes, animations, and real-time updates
- **Reset Functionality**: Easy reset for drag and scale operations

## 📸 Demo Screenshots

### Main Interface
```
![image](https://github.com/user-attachments/assets/2d09f863-71f8-4813-b211-a84a18375a4d)

```


### Gesture Interactions


## 🛠 Installation & Setup

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (2.17 or higher)
- Android Studio / VS Code
- Android/iOS emulator or physical device

### Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/Irakoze-Hortance/gesture_detector
   cd gesture_detector
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```


```

## 🎨 Key Components

### GestureDetector Callbacks Used

| Callback | Purpose | Container |
|----------|---------|-----------|
| `onTap` | Single tap detection | Blue, Red, Purple, Multi |
| `onDoubleTap` | Double tap detection | Blue, Multi |
| `onLongPress` | Long press detection | Green, Multi |
| `onLongPressStart` | Long press start | Green |
| `onLongPressEnd` | Long press end | Green |
| `onPanStart` | Drag start detection | Red |
| `onPanUpdate` | Drag movement tracking | Red |
| `onPanEnd` | Drag end detection | Red |
| `onScaleStart` | Scale/rotation start | Purple |
| `onScaleUpdate` | Scale/rotation tracking | Purple |
| `onScaleEnd` | Scale/rotation end | Purple |

#
## 🙏 Acknowledgments

- Flutter team for the amazing GestureDetector widget
- Material Design for UI inspiration
