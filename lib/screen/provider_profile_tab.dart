import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import 'provider_profile_screen.dart'; // Ensure this matches your filename

class ProviderProfileTab extends StatelessWidget {
  const ProviderProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          // --- USER HEADER ---
          const CircleAvatar(
            radius: 50, 
            backgroundImage: NetworkImage('https://via.placeholder.com/150')
          ),
          const SizedBox(height: 12),
          const Text("Abebe Kebede", 
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("Addis Ababa, Ethiopia", 
            style: TextStyle(color: Colors.grey, fontSize: 14)),
          
          const SizedBox(height: 30),

          // --- SECTION 1: ACCOUNT ---
          _sectionHeader("Account Settings"),
          _profileMenuItem(
            icon: Icons.person_outline,
            title: "Manage Profile & Services",
            onTap: () {
              // Navigates to the detailed editor page
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ProviderProfileScreen())
              );
            },
          ),
          _profileMenuItem(
            icon: Icons.star_border,
            title: "My Ratings & Reviews",
            onTap: () {
               // You can link your Reviews tab here later
            },
          ),

          // --- SECTION 2: APP PREFERENCES ---
          _sectionHeader("Preferences"),
          _profileMenuItem(
            icon: Icons.settings_outlined,
            title: "App Settings",
            onTap: () {},
          ),
          _profileMenuItem(
            icon: Icons.notifications_none,
            title: "Notifications",
            onTap: () {},
          ),

          const SizedBox(height: 30),
          
          // --- LOGOUT ---
          _profileMenuItem(
            icon: Icons.logout,
            title: "Logout",
            color: Colors.redAccent,
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: AppTheme.bgLightGrey.withOpacity(0.4),
      child: Text(title, 
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
    );
  }

  Widget _profileMenuItem({
    required IconData icon, 
    required String title, 
    required VoidCallback onTap, 
    Color color = Colors.black87
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color, size: 24),
      title: Text(title, 
        style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
    );
  }
}