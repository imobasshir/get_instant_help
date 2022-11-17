import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/home/drawer.dart';
import 'package:get_instant_help/pages/home/pages/doctor.dart';
import 'package:get_instant_help/pages/home/pages/guide.dart';
import 'package:get_instant_help/pages/home/pages/home.dart';
import 'package:get_instant_help/pages/home/pages/near_me.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final _bodyItem = [
    const HomeFirstPage(),
    Doctor(),
    const Guide(),
    const NearMe(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get Instant Help',
          style: TextStyle(
            fontFamily: 'GoogleSans',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _bodyItem[_currentIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        surfaceTintColor: Colors.lightGreen,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            label: 'Contact Doctor',
            icon: Icon(
              Icons.video_call_sharp,
              color: Colors.black54,
            ),
            selectedIcon: Icon(
              Icons.video_call_sharp,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            label: 'Guide',
            icon: Icon(
              Icons.medical_information,
              color: Colors.black54,
            ),
            selectedIcon: Icon(
              Icons.medical_information,
              color: Colors.white,
            ),
          ),
          NavigationDestination(
            label: 'Near Me',
            icon: Icon(
              Icons.local_hospital_rounded,
              color: Colors.black54,
            ),
            selectedIcon: Icon(
              Icons.local_hospital_rounded,
              color: Colors.white,
            ),
          ),
        ],
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
