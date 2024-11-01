import 'package:flutter/material.dart';
import 'package:wolkk_job/pages/custom_appbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});
  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> reasons = [
    "Asia’s fastest-growing digital economy",
    "274 million people, 50% under 30 years old",
    "3rd biggest young workforce after India and China",
    ">30% of population with English proficiency",
    ">850 IT Universities and Academies",
    ">80,000 fresh IT graduates entering the workforce every year",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/bg.png'),
            const SizedBox(height: 30),
            _buildTitleText(),
            const SizedBox(height: 30),
            _buildMainContent(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return const Text(
      'We source, build, and run your tech teams',
      style: TextStyle(
        color: Colors.black,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageColumn(),
        const SizedBox(width: 100),
        _buildTextColumn(),
      ],
    );
  }

  Widget _buildImageColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://wolkk.com/hubfs/wolkk%20camp%202023%204.jpg',
          width: 500,
          height: 600,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'Learn More',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Why Offshore?'),
        const SizedBox(height: 30),
        _buildTextContent(
          'Small and medium-sized businesses are always facing growing pressures. '
              'Your tech team capacities either hold you back or propel you forward. '
              'By reducing your costs by as much as 60%, you can infuse new energy '
              'and vigor into your enterprise.',
        ),
        const SizedBox(height: 30),
        _buildTextContent(
          'Acquire the most exceptional talent at a price that leaves you smiling',
          fontSize: 24,
        ),
        const SizedBox(height: 30),
        _buildSectionTitle('Why Indonesia?'),
        const SizedBox(height: 30),
        _buildReasonsList(),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildTextContent(String text, {double fontSize = 18}) {
    return SizedBox(
      width: 600,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildReasonsList() {
    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: reasons
            .map((reason) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              const Icon(Icons.check_circle_sharp, color: Colors.grey),
              const SizedBox(width: 10),
              Text(
                reason,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }
}
