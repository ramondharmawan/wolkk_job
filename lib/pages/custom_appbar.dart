import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 160,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Column(
          children: [
            _buildLanguageSelector(),
            const SizedBox(height: 40),
            _buildNavigationRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return const SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.language, color: Colors.black, size: 18),
          SizedBox(width: 5),
          Text(
            'English',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(width: 5),
          Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 18),
        ],
      ),
    );
  }

  Widget _buildNavigationRow(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://wolkk.com/hs-fs/hubfs/logo%20small.jpg?width=240&height=152&name=logo%20small.jpg',
            height: 180,
          ),
          Row(
            children: [
              _buildMenuItem(context, 'Home'),
              _buildMenuItem(context, 'Blog'),
              _buildMenuItem(context, 'Services', isDropdown: true),
              _buildMenuItem(context, 'Customers'),
              _buildMenuItem(context, 'About', isDropdown: true),
              _buildMenuItem(context, 'Download eBook'),
              _buildMenuItem(context, 'Careers'),
              _buildContactButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, {bool isDropdown = false}) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go('/careers');
      },
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          if (isDropdown)
            const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 18),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF425B76),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const SizedBox(
        height: 50,
        width: 120,
        child: Center(
          child: Text(
            'Contact Us',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
