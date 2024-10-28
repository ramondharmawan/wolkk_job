import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:wolkk_job/pages/custom_appbar.dart';

class CareerPages extends StatelessWidget {
  const CareerPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const Center(
              child: Text(
                'Wolkk Job!',
                style: TextStyle(fontSize: 100),
              ),
            ),
            const SizedBox(height: 80),
            const SizedBox(
              height: 100,
              child: TextField(
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  hintStyle: TextStyle(fontSize: 30),
                  hintText: 'Search',
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.search, color: Colors.black, size: 40),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              children: [
                _buildDropdownButtonWithBorder(context, 'Team', ['Team A']),
                const SizedBox(width: 10),
                _buildDropdownButtonWithBorder(context, 'Sub-speciality',
                    ['Sub-speciality', 'Sub-speciality 2']),
                const SizedBox(width: 10),
                _buildDropdownButtonWithBorder(context, 'Work Type', ['Full Time', 'Part Time']),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFD3d3d3), thickness: 3),
            const SizedBox(height: 20),
            const Text('4 Live Result', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 40),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                height: 170,
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tech Support Engineer - San Bantul (Remote)',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IT',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'San Bantul, BA, DIY (Remote)',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButtonWithBorder(
      BuildContext context, String hint, List<String> items) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            hint,
            style: const TextStyle(fontSize: 16),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            // Handle selection change if necessary
          },
        ),
      ),
    );
  }
}