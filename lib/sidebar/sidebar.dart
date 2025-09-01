import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final Function(int) onItemTap;
  const SideBar({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => onItemTap(0),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => onItemTap(1),
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text("Football"),
            onTap: () => onItemTap(2),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Calculator"),
            onTap: () => onItemTap(3),
          ),
        ],
      ),
    );
  }
}
