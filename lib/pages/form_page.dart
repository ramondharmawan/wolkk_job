import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Easy Apply',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Choose an option to autocomplete your application. You can still fill your profile manually.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),

            // Form(
            //   key: _formKey,
            //   child: ListView(
            //     children: [
            //       TextFormField(
            //         controller: _nameController,
            //         decoration: const InputDecoration(labelText: 'Name'),
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Please enter your name';
            //           }
            //           return null;
            //         },
            //       ),
            //       TextFormField(
            //         controller: _lastNameController,
            //         decoration: const InputDecoration(labelText: 'Last Name'),
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Please enter your last name';
            //           }
            //           return null;
            //         },
            //       ),
            //       TextFormField(
            //         controller: _emailController,
            //         decoration: const InputDecoration(labelText: 'Email'),
            //         keyboardType: TextInputType.emailAddress,
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Please enter your email';
            //           }
            //           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            //               .hasMatch(value)) {
            //             return 'Enter a valid email address';
            //           }
            //           return null;
            //         },
            //       ),
            //       TextFormField(
            //         controller: _phoneController,
            //         decoration:
            //             const InputDecoration(labelText: 'Phone Number'),
            //         keyboardType: TextInputType.phone,
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Please enter your phone number';
            //           }
            //           if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
            //             return 'Enter a valid phone number';
            //           }
            //           return null;
            //         },
            //       ),
            //       const SizedBox(height: 16),
            //       ElevatedButton(
            //         onPressed: () {
            //           // Implement file picker for CV upload here
            //           print("Upload CV");
            //         },
            //         child: const Text("Upload CV"),
            //       ),
            //       SizedBox(height: 16),
            //       ElevatedButton(
            //         onPressed: () {
            //           if (_formKey.currentState?.validate() ?? false) {
            //             // Process data
            //             print("Form submitted");
            //             print("Name: ${_nameController.text}");
            //             print("Last Name: ${_lastNameController.text}");
            //             print("Email: ${_emailController.text}");
            //             print("Phone: ${_phoneController.text}");
            //           }
            //         },
            //         child: const Text("Submit"),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  AppBar _buildHeader() {
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
            _buildNavigationRow(),
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

  Widget _buildNavigationRow() {
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
              _buildMenuItem('Home'),
              _buildMenuItem('Blog'),
              _buildMenuItem('Services', isDropdown: true),
              _buildMenuItem('Customers'),
              _buildMenuItem('About', isDropdown: true),
              _buildMenuItem('Download eBook'),
              _buildMenuItem('Careers'),
              _buildContactButton(
                const Color(0xFF425B76),
                'Contact Us',
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool isDropdown = false}) {
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
            const Icon(Icons.keyboard_arrow_down,
                color: Colors.black, size: 18),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildContactButton(Color color, String title, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(),
      child: Text(title),
    );
  }
}
