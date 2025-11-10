import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_api_controller.dart';

class SideBar extends StatelessWidget {
  final Function(int) onItemTap;
  final LoginApiController controller = Get.put(LoginApiController());

  SideBar({super.key, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Navigation Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => onItemTap(0),
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Football'),
            onTap: () => onItemTap(1),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: () => onItemTap(2),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () => onItemTap(3),
          ),
          ListTile(
            leading: const Icon(Icons.extension),
            title: const Text('Example'),
            onTap: () => onItemTap(4),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () => onItemTap(5),
          ),
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Premier Table'),
            onTap: () => onItemTap(6),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              Navigator.pop(context); // Close drawer
              await controller.logout(); // Call logout method
            },
          ),
        ],
      ),
    );
  }
}
