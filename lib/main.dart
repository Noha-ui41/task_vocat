
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 88, 67, 134),
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu), color: Color.fromARGB(255, 88, 67, 134),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), color: Color.fromARGB(255, 88, 67, 134),
            onPressed: () {},
          ),
        ],
      ),

      body: const Center(
        child: Text(
          'Welcome to Home',
          style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 154, 103, 255),
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 88, 67, 134)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color:  Color.fromARGB(255, 88, 67, 134)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color:  Color.fromARGB(255, 88, 67, 134)),
            label: 'Profile',
           ),
        ],
      ),
    )
   );
  }
}

