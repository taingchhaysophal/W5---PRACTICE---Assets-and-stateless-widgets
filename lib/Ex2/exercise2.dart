import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Buttons')),
        backgroundColor: const Color.fromARGB(255, 255, 245, 245),

        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10),

              // Primary button
              CustomButton(
                label: 'Submit',
                icon: Icons.send,
                buttonType: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 40),

              // Secondary button
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
              ),
              SizedBox(height: 30),

              // Disabled button
              CustomButton(
                label: 'Account',
                icon: Icons.person,
                buttonType: ButtonType.disabled,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ),
  );
}

// Enum for button types
enum ButtonType { primary, secondary, disabled }

// Enum for icon position
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.secondary,
    this.iconPosition = IconPosition.right,
  });

  // Helper method to get color based on button type
  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getButtonColor(),
        borderRadius: BorderRadius.circular(40),
      ),

      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //text and button stay at the middle
        children: _buildButtonContent(),
      ),
    );
  }

  //build the button content based on icon position
  List<Widget> _buildButtonContent() {
    final iconWidget = Icon(icon, size: 30, color: Colors.white);
    final textWidget = Text(label,style: TextStyle(fontSize: 20, color: Colors.white),);
    const spacer = SizedBox(width: 20);

    if (iconPosition == IconPosition.left) {
      // Icon on left
      return [iconWidget, spacer, textWidget];
    } else {
      // Icon on right
      return [textWidget, spacer, iconWidget];
    }
  }
}