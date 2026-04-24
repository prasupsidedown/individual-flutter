import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onGoToProfile;
  const HomeScreen({super.key, required this.onGoToProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Selamat datang di halaman profil saya.',
              style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: onGoToProfile,
                  icon: const Icon(Icons.person_outline, size: 18),
                  label: const Text('Lihat Profile Saya'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  tooltip: 'Logout',
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEEEE),
                    foregroundColor: const Color(0xFFCC0000),
                  ),
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
