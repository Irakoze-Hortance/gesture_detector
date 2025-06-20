import 'package:flutter/material.dart';

class GestureDetectorDemoPage extends StatefulWidget {
  const GestureDetectorDemoPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorDemoPage> createState() => _GestureDetectorDemoPageState();
}

class _GestureDetectorDemoPageState extends State<GestureDetectorDemoPage> {
  String _tapMessage = 'Tap the blue container';
  String _longPressMessage = 'Long press the green container';
  String _panMessage = 'Pan/Drag the red container';
  String _scaleMessage = 'Pinch/Scale the purple container';
  
  Offset _panOffset = Offset.zero;
  double _scaleFactor = 1.0;
  double _rotationAngle = 0.0;
  
  Color _tapColor = Colors.blue;
  Color _longPressColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Demo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Flutter GestureDetector',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            _buildSectionTitle('1. Tap Gestures'),
            GestureDetector(
              onTap: () {
                setState(() {
                  _tapMessage = 'Single tap detected! ';
                  _tapColor = Colors.blue.shade300;
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _tapColor = Colors.blue;
                  });
                });
              },
              onDoubleTap: () {
                setState(() {
                  _tapMessage = 'Double tap detected!';
                  _tapColor = Colors.orange;
                });
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _tapColor = Colors.blue;
                  });
                });
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: _tapColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _tapMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            _buildSectionTitle('2. Long Press Gesture'),
            GestureDetector(
              onLongPress: () {
                setState(() {
                  _longPressMessage = 'Long press activated! ';
                  _longPressColor = Colors.red;
                });
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _longPressMessage = 'Long press the green container';
                    _longPressColor = Colors.green;
                  });
                });
              },
              onLongPressStart: (details) {
                setState(() {
                  _longPressMessage = 'Long press started';
                });
              },
              onLongPressEnd: (details) {
                setState(() {
                  _longPressMessage = 'Long press ended! ';
                });
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: _longPressColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _longPressMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            _buildSectionTitle('3. Drag Gesture'),
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  _panMessage = 'Pan started! ';
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  _panOffset += details.delta;
                  _panMessage = 'Dragging... \nOffset';
                });
              },
              onPanEnd: (details) {
                setState(() {
                  _panMessage = 'Pan ended! Tap to reset position 🔄';
                });
              },
              onTap: () {
                setState(() {
                  _panOffset = Offset.zero;
                  _panMessage = 'Position reset! Pan/Drag the red container';
                });
              },
              child: Transform.translate(
                offset: _panOffset,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _panMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            _buildSectionTitle('4. Scale'),
            GestureDetector(
              onScaleStart: (details) {
                setState(() {
                  _scaleMessage = 'Scale started! ';
                });
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scaleFactor = details.scale;
                  _rotationAngle = details.rotation;
                  _scaleMessage = 'Scaling: ${_scaleFactor.toStringAsFixed(2)}x\nRotation: ${(_rotationAngle * 180 / 3.14159).toStringAsFixed(1)}°';
                });
              },
              onScaleEnd: (details) {
                setState(() {
                  _scaleMessage = 'Scale ended! Tap to reset 🔄';
                });
              },
              onTap: () {
                setState(() {
                  _scaleFactor = 1.0;
                  _rotationAngle = 0.0;
                  _scaleMessage = 'Reset! Pinch/Scale the purple container';
                });
              },
              child: Transform.scale(
                scale: _scaleFactor,
                child: Transform.rotate(
                  angle: _rotationAngle,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _scaleMessage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Complex Gesture Example
            _buildSectionTitle('5. Multi-Gesture Container'),
            _buildMultiGestureContainer(),
            
            const SizedBox(height: 20),
            
            // Instructions
            _buildInstructions(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }
  
  Widget _buildMultiGestureContainer() {
    return GestureDetector(
      onTap: () => _showSnackBar('Tapped!'),
      onDoubleTap: () => _showSnackBar('Double Tapped!'),
      onLongPress: () => _showSnackBar('Long Pressed!'),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.teal, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            '🎯 Multi-Gesture Container\nTry tap, double-tap, or long press!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  
  Widget _buildInstructions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

    );
  }
  
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}