import 'package:flutter/material.dart';

// City enum with weather data
enum City {
  phnom(
    name: 'PhnomPenh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    weatherIcon: Icons.cloud,
    gradientStart: Color(0xFFB24BF3),
    gradientEnd: Color(0xFF8A2BE2),
  ),
  paris(
    name: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    weatherIcon: Icons.cloud,
    gradientStart: Color(0xFF00D9A3),
    gradientEnd: Color(0xFF00B88D),
  ),
  rome(
    name: 'Rome',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherIcon: Icons.wb_sunny,
    gradientStart: Color(0xFFFF6B9D),
    gradientEnd: Color(0xFFFFA07A),
  ),
  toulouse(
    name: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherIcon: Icons.cloud,
    gradientStart: Color(0xFFD2A679),
    gradientEnd: Color(0xFFCDA876),
  );

  final String name;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final IconData weatherIcon;
  final Color gradientStart;
  final Color gradientEnd;

  const City({
    required this.name,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherIcon,
    required this.gradientStart,
    required this.gradientEnd,
  });
}

// Weather card
class WeatherCard extends StatelessWidget {
  final City city;

  const WeatherCard({
    super.key,
    required this.city
    });

  @override
  Widget build(BuildContext context) {
    
    return PhysicalModel(
      color: const Color.fromARGB(0, 255, 0, 0),
      elevation: 20,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(28),
      //box color
      child: Stack(
        children: [
          // Main gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [city.gradientStart, city.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
            child: Row(
              children: [
                // Weather icon in CircleAvatar
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.25),
                  child: Icon(city.weatherIcon, size: 48, color: Colors.white),
                ),

                //space btw icon and text
                const SizedBox(width: 24),

                // City name and temperature range
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    
      
                      Text(
                        'Min ${city.minTemp}°C',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.85),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Max ${city.maxTemp}°C',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.85),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Current temperature on the right
                Text(
                  '${city.currentTemp}°C',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Decorative oval on the right side
          Positioned(
            right: -40,
            top: -10,
            bottom: -50,
            child: Opacity(
              opacity: 0.12,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D9FD5),

        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
        itemCount: City.values.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all (14),
            child: WeatherCard(city: City.values[index]),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherHomePage(),
    )
  );
}