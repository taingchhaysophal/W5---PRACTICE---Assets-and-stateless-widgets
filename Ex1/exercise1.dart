import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
        ),
        backgroundColor: const Color.fromARGB(255, 173, 173, 173),

        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Hobby(
                icon: Icons.airplanemode_active,
                title: 'Travelling',
                color: Colors.green,
              ),

              SizedBox(height: 40),
              Hobby(
                icon: Icons.skateboarding,
                title: 'Skating',
                color: Colors.blue,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ),
  );
}

class Hobby extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const Hobby({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20
        ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          SizedBox(width: 20),
          Text(
            title, 
            style: TextStyle(
              fontSize: 20, color: Colors.white
              )
            ),
        ],
      ),
    );
  }
}
